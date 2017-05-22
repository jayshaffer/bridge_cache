class CreateBridgeCacheGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_cache_groups do |t|
      t.integer :bridge_id, limit: 8
      t.string :name
      t.integer :parent_id, limit: 8
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :membership_count
      t.integer :domain_id, limit: 8
      t.datetime :deleted_at
      t.string :type
      t.datetime :archived_at
      t.boolean :new_smart_group
      t.string :external_id
    end
  end
end
