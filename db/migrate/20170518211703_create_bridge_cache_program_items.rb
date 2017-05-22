class CreateBridgeCacheProgramItems < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_cache_program_items do |t|
      t.integer :bridge_id, limit: 8
      t.integer :program_id, limit: 8
      t.integer :position
      t.datetime :deleted_at
      t.integer :item_id, limit: 8
      t.string :item_type
    end
  end
end
