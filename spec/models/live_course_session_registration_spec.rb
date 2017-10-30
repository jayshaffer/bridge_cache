require 'spec_helper'

describe BridgeCache::LiveCourseSession, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::LiveCourseSessionRegistration.import_from_csv(get_fixture_path('live_course_session_registrations.csv'))
      expect(BridgeCache::LiveCourseSessionRegistration.all.count).to(eq(154))
    end

    it 'should scope by domain id' do
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      BridgeCache::LiveCourse.import_from_csv(get_fixture_path('live_courses.csv'))
      BridgeCache::LiveCourseEnrollment.import_from_csv(get_fixture_path('live_course_enrollments.csv'))
      BridgeCache::LiveCourseSession.import_from_csv(get_fixture_path('live_course_sessions.csv'))
      BridgeCache::LiveCourseSessionRegistration.import_from_csv(get_fixture_path('live_course_session_registrations.csv'))
      rows = BridgeCache::LiveCourseSession.in_domain(2)
      expect(rows.count).to(eq(1))
    end
  end

end
