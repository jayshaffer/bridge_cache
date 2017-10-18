module BridgeCache::Webhooks
  class Message

    attr_reader :payload

    def initialize(payload)
      @payload = payload
    end

    def resource_object
      @payload[@payload['resource']]
    end

    def payload_class
      "BridgeCache::#{@payload['resource'].camelcase}".constantize
    end
  end
end
