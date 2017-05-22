require 'spec_helper'

describe BridgeCache::Domain, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      expect(BridgeCache::Domain.all.count).to(eq(1))
    end
  end

end
