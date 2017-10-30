require 'spec_helper'

describe BridgeCache::LiveCourseSession, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::LiveCourseSession.import_from_csv(get_fixture_path('live_course_sessions.csv'))
      expect(BridgeCache::LiveCourseSession.all.count).to(eq(54))
    end

    it 'should have a number of session registrations' do
      BridgeCache::LiveCourseSession.import_from_csv(get_fixture_path('live_course_sessions.csv'))
      BridgeCache::LiveCourseSessionRegistration.import_from_csv(get_fixture_path('live_course_session_registrations.csv'))
      expect(BridgeCache::LiveCourseSession.first.live_course_session_registrations.count).to(eq(1))
    end

    it 'should scope by domain id' do
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      BridgeCache::LiveCourse.import_from_csv(get_fixture_path('live_courses.csv'))
      BridgeCache::LiveCourseSession.import_from_csv(get_fixture_path('live_course_sessions.csv'))
      BridgeCache::User.import_from_csv(get_fixture_path('users.csv'))
      rows = BridgeCache::LiveCourseSession.in_domain(2)
      expect(rows.count).to(eq(1))
    end

  end

end
