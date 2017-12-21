class CreateLiveCourses < ActiveRecord::Migration[5.1]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_live_courses do |t|
      t.integer :bridge_id, limit: 8
      t.string :title
      t.string :description
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :user_id, limit: 8
      t.integer :domain_id, limit: 8
      t.datetime :deleted_at
      t.integer :sessions_count
      t.integer :enrollments_count
      t.integer :attachments_count
      t.integer :sub_account_id, limit: 8
      t.integer :external_course_id, limit: 8
    end
  end
end
