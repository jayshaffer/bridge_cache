class CreateBridgeCacheGroupEnrollments < ActiveRecord::Migration[5.1]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_group_enrollments do |t|
      t.integer :bridge_id, limit: 8
      t.integer :group_id, limit: 8
      t.integer :course_template_id, limit: 8
      t.decimal :average_score
      t.integer :course_completion_count
      t.integer :learner_count
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
      t.decimal :completion_ratio
    end
  end
end
