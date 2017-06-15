require 'spec_helper'

describe BridgeCache::LearnerCustomFieldValue, type: :model do
  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::LearnerCustomFieldValue.import_from_csv(get_fixture_path('learner_custom_field_values.csv'))
      expect(BridgeCache::LearnerCustomFieldValue.count).to(eq(4))
    end
  end
end
