class CreateBridgeCacheProgramEnrollments < ActiveRecord::Migration[5.0]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_program_enrollments do |t|
      t.integer :bridge_id, limit: 8
      t.integer :user_id, limit: 8
      t.integer :program_id, limit: 8
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :start_at
      t.integer :state
      t.integer :average_score
      t.datetime :deleted_at
      t.integer :sources_count
      t.text :completed_program_item_ids
      t.integer :program_item_count
    end
  end
end
