require 'spec_helper'

describe BridgeCache::LiveCourse, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::LiveCourse.import_from_csv(get_fixture_path('live_courses.csv'))
      BridgeCache::LiveCourseEnrollment.import_from_csv(get_fixture_path('live_course_enrollments.csv'))
      expect(BridgeCache::LiveCourse.all.count).to(eq(43))
    end

    it 'should have a number of enrollments' do
      BridgeCache::LiveCourse.import_from_csv(get_fixture_path('live_courses.csv'))
      BridgeCache::LiveCourseEnrollment.import_from_csv(get_fixture_path('live_course_enrollments.csv'))
      expect(BridgeCache::LiveCourse.first.live_course_enrollments.size).to(eq(4))
    end
  end

end
