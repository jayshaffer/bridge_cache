class CreateBridgeCacheGrants < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_cache_grants do |t|
      t.integer :bridge_id, limit: 8
      t.integer :user_id, limit: 8
      t.integer :domain_id, limit: 8
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
      t.string :role_id
    end
  end
end
