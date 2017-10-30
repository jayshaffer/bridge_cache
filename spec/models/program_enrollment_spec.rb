require 'spec_helper'

describe BridgeCache::ProgramEnrollment, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::ProgramEnrollment.import_from_csv(get_fixture_path('program_enrollments.csv'))
      expect(BridgeCache::ProgramEnrollment.all.count).to(eq(8))
    end
  end

  describe 'check scope' do
    it 'should be able to scope by domain id' do
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      BridgeCache::Program.import_from_csv(get_fixture_path('programs.csv'))
      BridgeCache::ProgramEnrollment.import_from_csv(get_fixture_path('program_enrollments.csv'))
      rows = BridgeCache::ProgramEnrollment.in_domain(2)
      expect(rows.count).to(eq(1))
    end
  end


end
