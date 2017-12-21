class CreateLiveCourseSessionRegistrations < ActiveRecord::Migration[5.1]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_live_course_session_registrations do |t|
      t.integer :bridge_id, limit: 8
      t.integer :live_course_session_id, limit: 8
      t.integer :user_id, limit: 8
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :live_course_enrollment_id, limit: 8
      t.datetime :deleted_at
      t.text :config
      t.datetime :marked_complete_at
    end
  end
end
