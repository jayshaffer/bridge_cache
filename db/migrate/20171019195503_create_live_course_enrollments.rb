class CreateLiveCourseEnrollments < ActiveRecord::Migration[5.1]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_live_course_enrollments do |t|
      t.integer :bridge_id, limit: 8
      t.integer :live_course_id, limit: 8
      t.integer :user_id, limit: 8
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :state
      t.datetime :deleted_at
      t.integer :sources_count
      t.datetime :expires_at
      t.boolean :inactive
      t.datetime :renew_by
    end
  end
end
