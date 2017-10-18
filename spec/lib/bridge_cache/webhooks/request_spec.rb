require 'spec_helper'

describe BridgeCache::Webhooks::Request do
  describe '#process' do
    it 'calls the create method for a webhook request' do
      fixture = get_fixture("webhook_created.json")
      expect(BridgeCache::CourseTemplate.count).to(eq(0))
      BridgeCache::Webhooks::Request.new(JSON.parse(get_fixture("webhook_created.json"))).process
      expect(BridgeCache::CourseTemplate.count).to(eq(1))
    end

    it 'calls the updated method for a webhook request' do
      fixture = get_fixture("webhook_created.json")
      expect(BridgeCache::CourseTemplate.count).to(eq(0))
      BridgeCache::Webhooks::Request.new(JSON.parse(get_fixture("webhook_updated.json"))).process
      expect(BridgeCache::CourseTemplate.count).to(eq(1))
    end

    it 'calls the deleted method for a webhook request' do
      fixture = get_fixture("webhook_created.json")
      BridgeCache::Webhooks::Request.new(JSON.parse(get_fixture("webhook_created.json"))).process
      expect(BridgeCache::CourseTemplate.count).to(eq(1))
      BridgeCache::Webhooks::Request.new(JSON.parse(get_fixture("webhook_deleted.json"))).process
      expect(BridgeCache::CourseTemplate.count).to(eq(0))
    end
  end
end
