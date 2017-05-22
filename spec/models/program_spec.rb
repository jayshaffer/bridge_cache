require 'spec_helper'

describe BridgeCache::ProgramEnrollment, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Program.import_from_csv(get_fixture_path('programs.csv'))
      expect(BridgeCache::Program.all.count).to(eq(6))
    end
  end

end
