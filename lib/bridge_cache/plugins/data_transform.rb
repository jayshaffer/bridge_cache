module BridgeCache::Plugins
  class DataTransform

    def self.set_bridge_id(row)
      if row.key?('id')
        row['bridge_id'] = row['id'] if row.key?('id')
        row.delete('id')
      end
      row
    end

  end
end
