require 'spec_helper'

describe BridgeCache::ProgramEnrollment, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::ProgramEnrollment.import_from_csv(get_fixture_path('program_enrollments.csv'))
      expect(BridgeCache::ProgramEnrollment.all.count).to(eq(8))
    end
  end

end
