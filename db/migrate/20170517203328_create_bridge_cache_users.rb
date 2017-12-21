class CreateBridgeCacheUsers < ActiveRecord::Migration[5.0]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_users do |t|
      t.integer :bridge_id, limit: 8
      t.string :email
      t.string :uid
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
      t.string :avatar_url
      t.string :first_name
      t.string :last_name
      t.string :external_id
      t.integer :domain_id, limit: 8
      t.datetime :tac_accepted_at
      t.string :tagline
      t.string :locale
      t.boolean :unsubscribed, default: false
      t.datetime :welcomed_at
      t.datetime :logged_in_at
      t.text :config
      t.string :full_name
      t.string :sortable_name
      t.string :uuid
      t.integer :sub_account_id, limit: 8
      t.datetime :hire_date
      t.boolean :hidden, default: false
    end
  end
end
