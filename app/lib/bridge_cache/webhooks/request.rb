module BridgeCache::Webhooks
  class Request
    def initialize(payload)
      @payload = payload
    end

    def process
      message = BridgeCache::Webhooks::Message.new(@payload)
      message.payload_class.public_send("webhook_#{@payload['trigger']}".to_sym, message)
    end
  end
end
