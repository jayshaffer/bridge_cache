require 'spec_helper'

describe BridgeCache::Tagging, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Tagging.import_from_csv(get_fixture_path('taggings.csv'))
      expect(BridgeCache::Tagging.all.count).to(eq(6))
    end
  end

end
