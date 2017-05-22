require 'csv'

module BridgeCache::Plugins
  class CSVDump

    MAX_ROW_INTERVAL = 5000

    def self.dump_to_table(clazz, file_path)
      count = 1
      total = 0
      rows = []
      CSV.foreach(file_path, headers: true) do |row|
        total += 1
      end
      CSV.foreach(file_path, headers: true) do |row|
        if count < MAX_ROW_INTERVAL
          rows << initialze_row(clazz, row)
        end
        if count % MAX_ROW_INTERVAL == 0 || count == total
          dump_rows(clazz, rows)
          count = 0
          rows = []
        end
        count += 1
      end
    end

    def self.dump_row(clazz, row)
      instance = initialze_row(clazz, row)
      dump_rows(clazz, [instance])
    end

    private

    def self.initialze_row(clazz, row)
      instance = clazz.find_or_create_by(bridge_id: row['id'])
      instance.assign_attributes(remove_bad_columns(clazz, BridgeCache::Plugins::DataTransform::set_bridge_id(row).to_h))
      instance
    end

    def self.dump_rows(clazz, rows)
      rows.each do |row|
        row.save! if row.changed?
      end
    end

    def self.remove_bad_columns(clazz, row)
      row = row.delete_if {|key, value| !clazz.column_names.include?(key)}
      row
    end

  end
end
