class CreateBridgeCacheEnrollments < ActiveRecord::Migration[5.0]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_enrollments do |t|
      t.integer :bridge_id, limit: 8
      t.integer :user_id, limit: 8
      t.string :state
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :completed_at
      t.integer :score
      t.datetime :end_at
      t.integer :course_template_id, limit: 8
      t.integer :attempts_count
      t.boolean :required
      t.string :external_id
      t.datetime :deleted_at
      t.integer :sources_count
      t.text :config
      t.datetime :expires_at
      t.boolean :inactive
      t.datetime :renew_by
    end
  end
end
