class CreateBridgeCacheTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_cache_taggings do |t|
      t.integer :bridge_id, limit: 8
      t.integer :tag_id, limit: 8
      t.integer :taggable_id, limit: 8
      t.string :taggable_type
      t.string :tagger_id, limit: 8
      t.string :context
      t.datetime :created_at
      t.text :data
    end
  end
end
