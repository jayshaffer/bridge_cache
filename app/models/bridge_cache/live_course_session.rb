module BridgeCache
  class LiveCourseSession < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    def self.for_domain(domain_id)
      joins(:live_course).merge(BridgeCache::LiveCourse.for_domain(domain_id))
    end

    belongs_to :domain, foreign_key: :domain_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
    belongs_to :sub_account, foreign_key: :sub_account_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
    belongs_to :live_course, foreign_key: :live_course_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::LiveCourse.name, optional: true
    has_many :live_course_session_registrations, foreign_key: :live_course_session_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::LiveCourseSessionRegistration.name

  end
end
