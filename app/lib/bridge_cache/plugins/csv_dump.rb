require 'csv'

module BridgeCache::Plugins
  class CSVDump
    MAX_ROW_INTERVAL = 5000

    def self.bulk_import(iterator, model)
      ids = []
      rows = []
      klass = "BridgeCache::#{model.camelcase}".constantize

      csv_column_names = klass.csv_mapping.keys
      database_column_names = klass.csv_mapping.values

      iterator.each_row(model.pluralize) do |row|
        row = remove_bad_columns(klass, BridgeCache::Plugins::DataTransform.set_bridge_id(row).to_h)
        row = klass.format_import_row(row)
        rows << csv_column_names.map { |column| row[column] }
        ids << row['bridge_id']

        if rows.length >= BridgeCache.batch_size
          perform_bulk_import(klass, database_column_names, rows)
          rows = []
        end
      end

      perform_bulk_import(klass, database_column_names, rows)
      ids
    end

    def self.dump_to_table(clazz, file_path)
      count = 1
      total = 0
      rows = []
      CSV.foreach(file_path, headers: true) do |_row|
        total += 1
      end
      CSV.foreach(file_path, headers: true) do |row|
        rows << initialze_row(clazz, row) if count < MAX_ROW_INTERVAL
        if count % MAX_ROW_INTERVAL == 0 || count == total
          dump_rows(rows)
          count = 0
          rows = []
        end
        count += 1
      end
    end

    def self.dump_row(clazz, row)
      instance = initialze_row(clazz, row)
      dump_rows([instance])
    end

    private

    def self.perform_bulk_import(klass, columns, rows)
      return if rows.empty?
      columns = columns.dup
      klass.import(columns, rows, validate: false, on_duplicate_key_update: {
                     constraint_name: klass.uniq_constraint_name,
                     condition: condition_sql(klass, columns),
                     columns: columns
                   })
    end

    # This method generates SQL that looks like:
    # (users.sis_id, users.email) IS DISTINCT FROM (EXCLUDED.sis_id, EXCLUDED.email)
    #
    # This prevents activerecord-import from setting the `updated_at` column for
    # rows that haven't actually changed. This allows you to query for rows that have changed
    # by doing something like:
    #
    # started_at = Time.now
    # run_the_users_sync!
    # changed = User.where("updated_at >= ?", started_at)
    def self.condition_sql(klass, columns)
      columns_str = columns.map { |c| "#{klass.quoted_table_name}.#{c}" }.join(', ')
      excluded_str = columns.map { |c| "EXCLUDED.#{c}" }.join(', ')
      "(#{columns_str}) IS DISTINCT FROM (#{excluded_str})"
    end

    def self.initialze_row(clazz, row)
      instance = clazz.find_or_create_by(bridge_id: row['id'])
      instance.assign_attributes(remove_bad_columns(clazz, BridgeCache::Plugins::DataTransform.set_bridge_id(row).to_h))
      instance
    end

    def self.dump_rows(rows)
      rows.each do |row|
        row.save! if row.changed?
      end
    end

    def self.remove_bad_columns(clazz, row)
      row = row.delete_if { |key, _value| !clazz.column_names.include?(key) }
      row
    end
  end
end
