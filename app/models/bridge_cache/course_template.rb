module BridgeCache
  class CourseTemplate < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :user, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true
    belongs_to :domain, foreign_key: :domain_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    belongs_to :sub_account, foreign_key: :sub_account_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    has_many :enrollments, foreign_key: :course_template_id, primary_key: :bridge_id, class_name: 'BridgeCache::Enrollment'
    has_many :group_enrollments, foreign_key: :course_template_id, primary_key: :bridge_id, class_name: 'BridgeCache::GroupEnrollment'
    has_many :affiliated_sub_accounts, primary_key: :bridge_id, class_name: 'BridgeCache::AffiliatedSubAccount', as: :item
    has_many :domains, through: :affiliated_sub_accounts

  end
end
