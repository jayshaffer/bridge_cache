module BridgeCache
  class User < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    belongs_to :domain, foreign_key: :domain_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Domain', optional: true
    belongs_to :sub_account, foreign_key: :sub_account_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Domain', optional: true
    has_many :enrollments, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Enrollment'
    has_many :course_templates, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::CourseTemplate'
    has_many :taggings, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Tagging'
    has_many :grants, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Grant'
    has_many :groups, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Group'
    has_many :program_enrollments, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::ProgramEnrollment'
    has_many :memberships, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Membership'
    has_many :learner_custom_field_values, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::LearnerCustomFieldValue'
    has_many :live_course_enrollments, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::LiveCourseEnrollment'
    has_many :live_course_session_registrations, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::LiveCourseSessionRegistration'

    serialize :config

    def self.for_domain(domain_id)
      where('bridge_cache_users.sub_account_id = ?', domain_id)
    end

  end
end
