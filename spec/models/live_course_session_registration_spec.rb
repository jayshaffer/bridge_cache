require 'spec_helper'

describe BridgeCache::LiveCourseSession, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::LiveCourseSessionRegistration.import_from_csv(get_fixture_path('live_course_session_registrations.csv'))
      expect(BridgeCache::LiveCourseSessionRegistration.all.count).to(eq(154))
    end
  end

end
