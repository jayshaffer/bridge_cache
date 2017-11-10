require 'spec_helper'

describe BridgeCache::CustomField, type: :model do
  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::CustomField.import_from_csv(get_fixture_path('custom_fields.csv'))
      expect(BridgeCache::CustomField.all.count).to(eq(12))
    end
  end
end
