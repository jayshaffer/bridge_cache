require 'spec_helper'

describe BridgeCache::User, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::User.import_from_csv(get_fixture_path('users.csv'))
      expect(BridgeCache::User.all.count).to(eq(2))
    end
  end

  describe 'check associations' do
    it 'should be able to pull associations from its parent' do
      BridgeCache::User.import_from_csv(get_fixture_path('users.csv'))
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      BridgeCache::Domain.import_from_csv(get_fixture_path('enrollments.csv'))
      expect(BridgeCache::User.first.domain).to(eq(BridgeCache::Domain.first))
      expect(BridgeCache::User.first.enrollments.first).to(eq(BridgeCache::Enrollment.first))
    end

    it 'should have a number of live course enrollments' do
      BridgeCache::LiveCourseEnrollment.import_from_csv(get_fixture_path('live_course_enrollments.csv'))
      BridgeCache::User.import_from_csv(get_fixture_path('users.csv'))
      expect(BridgeCache::User.first.live_course_enrollments.count).to(eq(1))
    end

    it 'should have a number of live course session registrations' do
      BridgeCache::LiveCourseSessionRegistration.import_from_csv(get_fixture_path('live_course_session_registrations.csv'))
      BridgeCache::User.import_from_csv(get_fixture_path('users.csv'))
      expect(BridgeCache::User.first.live_course_session_registrations.count).to(eq(1))
    end

  end

end
