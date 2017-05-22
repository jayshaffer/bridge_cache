require 'spec_helper'

describe BridgeCache::Tag, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Tag.import_from_csv(get_fixture_path('tags.csv'))
      expect(BridgeCache::Tag.all.count).to(eq(9))
    end
  end

end
