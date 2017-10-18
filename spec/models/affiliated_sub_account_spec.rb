require 'spec_helper'

describe BridgeCache::AffiliatedSubAccount, type: :model do
  describe '.import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::CourseTemplate.create!(bridge_id: 1)
      BridgeCache::AffiliatedSubAccount.import_from_csv(get_fixture_path('affiliated_sub_accounts.csv'))
      expect(BridgeCache::AffiliatedSubAccount.count).to(eq(1))
    end
  end

  describe 'callbacks' do
    describe '#fix_item_type' do
      it 'prepends the item_type with BridgeCache' do
        BridgeCache::AffiliatedSubAccount.create!(item_id: 1, item_type: 'CourseTemplate')
        expect(BridgeCache::AffiliatedSubAccount.last.item_type).to eq('BridgeCache::CourseTemplate')
      end
    end
  end

  describe 'associations' do
    it { should belong_to(:item) }
    it { should belong_to(:domain) }
  end
end
