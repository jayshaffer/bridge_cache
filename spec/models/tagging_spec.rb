require 'spec_helper'

describe BridgeCache::Tagging, type: :model do
  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Tagging.import_from_csv(get_fixture_path('taggings.csv'))
      expect(BridgeCache::Tagging.all.count).to(eq(6))
    end
  end

  describe '.cleanup' do
    let!(:tagging1) { BridgeCache::Tagging.create(bridge_id: 1) }
    let!(:tagging2) { BridgeCache::Tagging.create(bridge_id: 2) }
    let!(:tagging3) { BridgeCache::Tagging.create(bridge_id: 3) }
    let!(:tagging4) { BridgeCache::Tagging.create(bridge_id: 4) }

    it 'should delete any saved Taggings not included in the array of row_ids' do
      expect do
        BridgeCache::Tagging.cleanup([tagging1.bridge_id, tagging3.bridge_id])
      end.to change { BridgeCache::Tagging.count }.by(-2)

      expect(BridgeCache::Tagging.find_by_id(tagging2.id)).to be_nil
      expect(BridgeCache::Tagging.find_by_id(tagging4.id)).to be_nil
    end
  end
end
