require 'spec_helper'

describe BridgeCache::Membership, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Membership.import_from_csv(get_fixture_path('memberships.csv'))
      expect(BridgeCache::Membership.all.count).to(eq(11))
    end
  end


  describe 'check scope' do
    it 'should be able to scope by domain id' do
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      BridgeCache::Group.import_from_csv(get_fixture_path('groups.csv'))
      BridgeCache::Membership.import_from_csv(get_fixture_path('memberships.csv'))
      rows = BridgeCache::Membership.in_domain(2)
      expect(rows.count).to(eq(1))
    end
  end

end
