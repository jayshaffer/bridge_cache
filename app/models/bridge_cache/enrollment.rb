module BridgeCache
  class Enrollment < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    def self.for_domain(domain_id)
      joins(:course_template).merge(BridgeCache::CourseTemplate.for_domain(domain_id))
    end

    belongs_to :user, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::User.name, optional: true
    belongs_to :course_template, foreign_key: :course_template_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::CourseTemplate.name, optional: true
  end
end
