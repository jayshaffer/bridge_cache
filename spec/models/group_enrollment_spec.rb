require 'spec_helper'

describe BridgeCache::GroupEnrollment, type: :model do
  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::GroupEnrollment.import_from_csv(get_fixture_path('group_enrollments.csv'))
      expect(BridgeCache::GroupEnrollment.all.count).to(eq(1))
    end
  end

  describe 'check scope' do
    it 'should be able to scope by domain id' do
      BridgeCache::CourseTemplate.import_from_csv(get_fixture_path('course_templates.csv'))
      BridgeCache::GroupEnrollment.import_from_csv(get_fixture_path('group_enrollments.csv'))
      expect(BridgeCache::GroupEnrollment.in_domain(1).count).to(eq(1))
    end
  end
end
