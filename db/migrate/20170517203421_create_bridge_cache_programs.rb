class CreateBridgeCachePrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_cache_programs do |t|
      t.integer :bridge_id, limit: 8
      t.string :title
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :assignment_period
      t.datetime :published_at
      t.text :unpublished_changes
      t.integer :domain_id, limit: 8
      t.datetime :deleted_at
      t.integer :learner_enrollments_count
      t.integer :sub_account_id, limit: 8
      t.string :description
      t.boolean :has_certificate, default: false
      t.integer :external_id, limit: 8
    end
  end
end
