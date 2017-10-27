class CreateLiveCourseSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :bridge_cache_live_course_sessions do |t|
      t.integer :bridge_id, limit: 8
      t.datetime :start_at
      t.datetime :end_at
      t.string :location
      t.integer :seats
      t.integer :live_course_id, limit: 8
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :registered_count
      t.datetime :concluded_at
      t.datetime :deleted_at
      t.string :notes
      t.integer :domain_id, limit: 8
      t.integer :sub_account_id, limit: 8
      t.integer :present_count
      t.string :title
      t.integer :parent_id, limit: 8
      t.boolean :multi_part
      t.string :timezone
      t.datetime :published_at
    end
  end
end
