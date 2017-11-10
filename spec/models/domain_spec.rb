require 'spec_helper'

describe BridgeCache::Domain, type: :model do
  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      expect(BridgeCache::Domain.all.count).to(eq(1))
    end
  end

  describe '#owner' do
    it 'should get the owner of a domain (manager)' do
      user = FactoryBot.create(:bridge_cache_user)
      domain = FactoryBot.create(:bridge_cache_domain, owner: user)
      expect(domain.owner.id).to(eq(user.id))
    end
  end
end
