module BridgeCache
  class BridgeBaseModel < ActiveRecord::Base
    self.abstract_class = true

    BRIDGE_ID = 'bridge_id'.freeze
    OWNER_ID = 'owner_id'.freeze
    PARENT_ID = 'parent_id'.freeze
    DOMAIN_ID = 'domain_id'.freeze

    def bridge_id
      if self.class.column_names.include? BRIDGE_ID
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
