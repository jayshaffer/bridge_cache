class CreateBridgeCacheDomains < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_cache_domains do |t|
      t.integer :bridge_id, limit: 8
      t.string :name
      t.integer :parent_id, limit: 8
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
      t.text :config
      t.integer :owner_id, limit: 8
      t.boolean :active
      t.integer :users_count
      t.integer :course_templates_count
      t.integer :domain_type
    end
  end
end
