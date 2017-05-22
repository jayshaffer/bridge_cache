require 'spec_helper'

describe BridgeCache::ProgramGroupEnrollment, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::ProgramGroupEnrollment.import_from_csv(get_fixture_path('program_group_enrollments.csv'))
      expect(BridgeCache::ProgramGroupEnrollment.all.count).to(eq(2))
    end
  end

end
