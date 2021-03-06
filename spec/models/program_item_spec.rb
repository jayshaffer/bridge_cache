require 'spec_helper'

describe BridgeCache::ProgramItem, type: :model do
  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::ProgramItem.import_from_csv(get_fixture_path('program_items.csv'))
      expect(BridgeCache::ProgramItem.all.count).to(eq(7))
    end
  end

  describe 'check scope' do
    it 'should be able to scope by domain id' do
      BridgeCache::Program.import_from_csv(get_fixture_path('programs.csv'))
      BridgeCache::ProgramItem.import_from_csv(get_fixture_path('program_items.csv'))
      rows = BridgeCache::ProgramItem.in_domain(2)
      expect(rows.count).to(eq(1))
    end
  end
end
