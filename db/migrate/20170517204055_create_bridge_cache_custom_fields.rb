class CreateBridgeCacheCustomFields < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_cache_custom_fields do |t|
      t.integer :bridge_id, limit: 8
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
      t.integer :domain_id, limit: 8
    end
  end
end
