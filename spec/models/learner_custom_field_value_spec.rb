require 'spec_helper'

describe BridgeCache::LearnerCustomFieldValue, type: :model do
  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::LearnerCustomFieldValue.import_from_csv(get_fixture_path('learner_custom_field_values.csv'))
      expect(BridgeCache::LearnerCustomFieldValue.count).to(eq(4))
    end
  end


  describe 'check scope' do
    it 'should be able to scope by domain id' do
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      BridgeCache::User.import_from_csv(get_fixture_path('users.csv'))
      BridgeCache::LearnerCustomFieldValue.import_from_csv(get_fixture_path('learner_custom_field_values.csv'))
      rows = BridgeCache::LearnerCustomFieldValue.in_domain(1)
      expect(rows.count).to(eq(1))
    end
  end

end
