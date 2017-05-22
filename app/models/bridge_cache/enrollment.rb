module BridgeCache
  class Enrollment < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :user, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true
    belongs_to :course_template, foreign_key: :course_template_id, primary_key: :bridge_id, class_name: 'BridgeCache::CourseTemplate', optional: true

  end
end
