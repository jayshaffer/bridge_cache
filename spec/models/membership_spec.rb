require 'spec_helper'

describe BridgeCache::Membership, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Membership.import_from_csv(get_fixture_path('memberships.csv'))
      expect(BridgeCache::Membership.all.count).to(eq(11))
    end
  end

end
