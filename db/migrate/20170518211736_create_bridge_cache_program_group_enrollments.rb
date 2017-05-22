class CreateBridgeCacheProgramGroupEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :bridge_cache_program_group_enrollments do |t|
      t.integer :bridge_id, limit: 8
      t.integer :group_id, limit: 8
      t.integer :program_id, limit: 8
      t.datetime :created_at
      t.datetime :updated_at
      t.datetime :deleted_at
    end
  end
end
