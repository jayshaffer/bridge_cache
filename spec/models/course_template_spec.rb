require 'spec_helper'

describe BridgeCache::CourseTemplate, type: :model do

  describe 'import_from_csv' do
    it 'should be able to take a csv dump into a table' do
      BridgeCache::CourseTemplate.import_from_csv(get_fixture_path('course_templates.csv'))
      expect(BridgeCache::CourseTemplate.all.count).to(eq(10))
    end
  end

  describe 'check associations' do
    it 'should be able to pull associations from its parent' do
      BridgeCache::CourseTemplate.import_from_csv(get_fixture_path('course_templates.csv'))
      BridgeCache::Domain.import_from_csv(get_fixture_path('domains.csv'))
      BridgeCache::User.import_from_csv(get_fixture_path('users.csv'))
      expect(BridgeCache::CourseTemplate.first.domain).to(eq(BridgeCache::Domain.first))
      expect(BridgeCache::CourseTemplate.first.user).to(eq(BridgeCache::User.first))
    end
  end

end
