require 'spec_helper'

describe BridgeCache::Enrollment, type: :model do
  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::Enrollment.import_from_csv(get_fixture_path('enrollments.csv'))
      expect(BridgeCache::Enrollment.all.count).to(eq(9))
    end
  end

  describe 'check scope' do
    it 'should be able to scope by domain id' do
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      BridgeCache::CourseTemplate.import_from_csv(get_fixture_path('course_templates.csv'))
      BridgeCache::Enrollment.import_from_csv(get_fixture_path('enrollments.csv'))
      rows = BridgeCache::Enrollment.in_domain(1)
      expect(rows.count).to(eq(1))
    end
  end
end
