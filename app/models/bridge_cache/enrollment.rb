module BridgeCache
  class Enrollment < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    def self.for_domain(domain_id)
      joins(:course_template).merge(BridgeCache::CourseTemplate.for_domain(domain_id))
    end

    belongs_to :user, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true
    belongs_to :course_template, foreign_key: :course_template_id, primary_key: :bridge_id, class_name: 'BridgeCache::CourseTemplate', optional: true

  end
end
