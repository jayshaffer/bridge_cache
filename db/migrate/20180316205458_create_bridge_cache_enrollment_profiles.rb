class CreateBridgeCacheEnrollmentProfiles < ActiveRecord::Migration[5.1]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_enrollment_profiles do |t|
      t.integer :bridge_id, limit: 8
      t.integer :enrollable_id, limit: 8
      t.string :enrollable_type
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :domain_id, limit: 8
      t.string :uuid
      t.datetime :deleted_at
      t.jsonb :config, default: '{}'
      t.boolean :expires
      t.boolean :auto_re_enroll
      t.boolean :open_enrollment
    end
  end
end
