module BridgeCache
  class GroupEnrollment < ApplicationRecord
    extend BridgeCache::Data::BridgeModel

    belongs_to :group, foreign_key: :group_id, primary_key: :bridge_id, class_name: 'BridgeCache::Group', optional: true
    belongs_to :course_template, foreign_key: :course_template_id, primary_key: :bridge_id, class_name: 'BridgeCache::CourseTemplate', optional: true

  end
end
