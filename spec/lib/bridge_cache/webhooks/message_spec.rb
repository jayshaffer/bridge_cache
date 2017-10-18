require 'spec_helper'

describe BridgeCache::Webhooks::Message do
  describe '#process' do
    it 'calls the payload method for the message' do
      fixture = get_fixture("webhook_created.json")
      expect(BridgeCache::Webhooks::Message.new(JSON.parse(get_fixture("webhook_created.json"))).payload_class).to(eq(BridgeCache::CourseTemplate))
    end
  end
end
