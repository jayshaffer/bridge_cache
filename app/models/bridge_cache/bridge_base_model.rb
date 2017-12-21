module BridgeCache
  class BridgeBaseModel < ActiveRecord::Base
    self.abstract_class = true

    def bridge_id
      if self.class.column_names.include? "bridge_id"
         self[:bridge_id]
      else
        id
      end
    end

    def adjusted_table_name
      if BridgeCache.use_internal_database
        table_name
      else
        self.to_s.demodulize.underscore.pluralize
      end
    end

  end
end
