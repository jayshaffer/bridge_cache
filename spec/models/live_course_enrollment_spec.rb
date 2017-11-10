require 'spec_helper'

describe BridgeCache::LiveCourseEnrollment, type: :model do
  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::LiveCourseEnrollment.import_from_csv(get_fixture_path('live_course_enrollments.csv'))
      expect(BridgeCache::LiveCourseEnrollment.all.count).to(eq(118))
    end

    it 'should have a number of session registrations' do
      BridgeCache::LiveCourseEnrollment.import_from_csv(get_fixture_path('live_course_enrollments.csv'))
      BridgeCache::LiveCourseSessionRegistration.import_from_csv(get_fixture_path('live_course_session_registrations.csv'))
      expect(BridgeCache::LiveCourseEnrollment.first.live_course_session_registrations.count).to(eq(4))
    end

    it 'should scope by domain id' do
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      BridgeCache::LiveCourse.import_from_csv(get_fixture_path('live_courses.csv'))
      BridgeCache::LiveCourseEnrollment.import_from_csv(get_fixture_path('live_course_enrollments.csv'))
      BridgeCache::User.import_from_csv(get_fixture_path('users.csv'))
      rows = BridgeCache::LiveCourseEnrollment.in_domain(2)
      expect(rows.count).to(eq(2))
    end
  end
end
