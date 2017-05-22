require 'spec_helper'

describe BridgeCache::Enrollment, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Enrollment.import_from_csv(get_fixture_path('enrollments.csv'))
      expect(BridgeCache::Enrollment.all.count).to(eq(9))
    end
  end

end
