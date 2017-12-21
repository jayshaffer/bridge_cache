class CreateAffiliatedSubAccounts < ActiveRecord::Migration[5.1]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_affiliated_sub_accounts do |t|
      t.integer :bridge_id
      t.integer :item_id
      t.string :item_type
      t.integer :domain_id
      t.datetime :deleted_at
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :state
      t.integer :sources_count
    end
  end
end
