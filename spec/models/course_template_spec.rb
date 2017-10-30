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

    it { should have_many(:affiliated_sub_accounts) }
    it { should have_many(:domains) }
  end

  describe 'check scope' do
    it 'should scope to domain by affilicated accounts' do
      BridgeCache::CourseTemplate.import_from_csv(get_fixture_path('course_templates.csv'))
      BridgeCache::AffiliatedSubAccount.import_from_csv(get_fixture_path('affiliated_sub_accounts.csv'))
      rows = BridgeCache::CourseTemplate.in_domain(50).all
      expect(rows.count).to(eq(1))
    end
  end

end
