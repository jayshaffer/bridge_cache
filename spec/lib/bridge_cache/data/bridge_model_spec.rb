require 'spec_helper'

describe BridgeCache::Data::BridgeModel do
  describe '#active' do
    it 'should only show active records' do
      BridgeCache::User.import_from_csv(get_fixture_path('users.csv'))
      expect(BridgeCache::User.active.count).to(eq(1))
      expect(BridgeCache::User.count).to(eq(2))
    end
  end
end
