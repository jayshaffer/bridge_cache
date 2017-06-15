module BridgeCache
  class User < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :domain, foreign_key: :domain_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    belongs_to :sub_account, foreign_key: :sub_account_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    has_many :enrollments, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::Enrollment'
    has_many :course_templates, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::CourseTemplate'
    has_many :taggings, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::Tagging'
    has_many :grants, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::Grant'
    has_many :groups, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::Group'
    has_many :program_enrollments, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::ProgramEnrollment'
    has_many :memberships, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::Membership'
    has_many :learner_custom_field_values, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::LearnerCustomFieldValue'

    serialize :config

  end
end
