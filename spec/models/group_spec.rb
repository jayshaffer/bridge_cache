require 'spec_helper'

describe BridgeCache::Group, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Group.import_from_csv(get_fixture_path('groups.csv'))
      expect(BridgeCache::Group.all.count).to(eq(8))
    end
  end

end
