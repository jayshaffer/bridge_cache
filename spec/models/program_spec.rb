require 'spec_helper'

describe BridgeCache::ProgramEnrollment, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Program.import_from_csv(get_fixture_path('programs.csv'))
      expect(BridgeCache::Program.all.count).to(eq(6))
    end
  end

  describe 'check scope' do
    it 'should scope to domain' do
      BridgeCache::Program.import_from_csv(get_fixture_path('programs.csv'))
      rows = BridgeCache::Program.in_domain(2).all
      expect(rows.count).to(eq(1))
    end
  end


end
