module BridgeCache
  class LiveCourseSessionRegistration < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    def self.for_domain(domain_id)
      joins(:live_course_enrollment).merge(BridgeCache::LiveCourseEnrollment.for_domain(domain_id))
    end

    belongs_to :user, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::User.name, optional: true
    belongs_to :domain, foreign_key: :domain_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
    belongs_to :live_course_enrollment, primary_key: BridgeCache.primary_key, class_name: BridgeCache::LiveCourseEnrollment.name, optional: true
    belongs_to :live_course_session, primary_key: BridgeCache.primary_key, class_name: BridgeCache::LiveCourseSession.name, optional: true

  end
end
