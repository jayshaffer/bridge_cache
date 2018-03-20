module BridgeCache
  class CourseTemplate < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    belongs_to :user, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::User.name, optional: true
    belongs_to :domain, foreign_key: :domain_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
    belongs_to :sub_account, foreign_key: :sub_account_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
    has_many :enrollments, foreign_key: :course_template_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Enrollment.name
    has_many :group_enrollments, foreign_key: :course_template_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::GroupEnrollment.name
    has_many :affiliated_sub_accounts, primary_key: BridgeCache.primary_key, class_name: BridgeCache::AffiliatedSubAccount.name, as: :item
    has_many :domains, through: :affiliated_sub_accounts
    belongs_to :sub_account, foreign_key: :sub_account_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
    has_many :enrollment_profiles, as: :enrollable, primary_key: BridgeCache.primary_key, class_name: BridgeCache::EnrollmentProfile.name

    def self.for_domain(domain_id)
      includes(:domains)
      .where('bridge_cache_affiliated_sub_accounts.domain_id = ? OR bridge_cache_course_templates.sub_account_id = ?', domain_id, domain_id)
      .references(:domains)
    end

  end
end
