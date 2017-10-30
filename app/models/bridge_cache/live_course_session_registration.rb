module BridgeCache
  class LiveCourseSessionRegistration < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    def self.for_domain(domain_id)
      joins(:live_course_enrollment).merge(BridgeCache::LiveCourseEnrollment.for_domain(domain_id))
    end

    belongs_to :user, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true
    belongs_to :domain, foreign_key: :domain_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    belongs_to :live_course_enrollment, primary_key: :bridge_id, class_name: 'BridgeCache::LiveCourseEnrollment', optional: true
    belongs_to :live_course_session, primary_key: :bridge_id, class_name: 'BridgeCache::LiveCourseSession', optional: true

  end
end
