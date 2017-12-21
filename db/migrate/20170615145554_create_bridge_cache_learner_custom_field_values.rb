class CreateBridgeCacheLearnerCustomFieldValues < ActiveRecord::Migration[5.1]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_learner_custom_field_values do |t|
      t.integer :bridge_id, limit: 8
      t.integer :custom_field_id, limit: 8
      t.integer :user_id, limit: 8
      t.string :value
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
