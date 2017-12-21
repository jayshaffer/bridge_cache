module BridgeCache
  class GroupEnrollment < ApplicationRecord
    extend BridgeCache::Data::BridgeModel

    def self.for_domain(domain_id)
      joins(:course_template).where(bridge_cache_course_templates: {domain_id: domain_id})
    end

    belongs_to :group, foreign_key: :group_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Group', optional: true
    belongs_to :course_template, foreign_key: :course_template_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::CourseTemplate', optional: true

  end
end
