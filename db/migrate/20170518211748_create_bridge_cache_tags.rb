class CreateBridgeCacheTags < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_cache_tags do |t|
      t.integer :bridge_id, limit: 8
      t.string :name
      t.integer :taggings_count
    end
  end
end
