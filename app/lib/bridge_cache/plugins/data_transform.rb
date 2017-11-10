module BridgeCache::Plugins
  class DataTransform
    def self.set_bridge_id(row)
      if row.key?('id')
        row['bridge_id'] = row['id'] if row.key?('id')
        row.delete('id')
      end
      row
    end

    def self.valid_json?(json)
      json = JSON.parse(json) unless json.class == Hash
      return json
    rescue JSON::ParserError => e
      return false
    end
  end
end
