require 'spec_helper'

describe BridgeCache::Grant, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Grant.import_from_csv(get_fixture_path('grants.csv'))
      expect(BridgeCache::Grant.all.count).to(eq(7))
    end
  end

end
