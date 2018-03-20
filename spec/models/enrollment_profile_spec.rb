require 'spec_helper'

describe BridgeCache::EnrollmentProfile, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::EnrollmentProfile.import_from_csv(get_fixture_path('enrollment_profiles.csv'))
      expect(BridgeCache::EnrollmentProfile.all.count).to(eq(2))
    end
  end
end
