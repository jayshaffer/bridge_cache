module BridgeCache
  class LiveCourse < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :user, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true
    belongs_to :domain, foreign_key: :domain_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    belongs_to :sub_account, foreign_key: :sub_account_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    has_many :live_course_enrollments, foreign_key: :live_course_id, primary_key: :bridge_id, class_name: 'BridgeCache::LiveCourseEnrollment'

  end
end
