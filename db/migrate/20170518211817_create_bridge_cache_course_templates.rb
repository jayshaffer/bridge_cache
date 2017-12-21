class CreateBridgeCacheCourseTemplates < ActiveRecord::Migration[5.0]
  def change
    return unless BridgeCache.use_internal_database
    create_table :bridge_cache_course_templates do |t|
      t.integer :bridge_id, limit: 8
      t.string :title
      t.integer :estimated_time
      t.integer :user_id, limit: 8
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :passing_threshold
      t.datetime :published_at
      t.integer :default_days_until_due
      t.boolean :has_unpublished_changes
      t.boolean :has_certificate
      t.string :external_id
      t.string :draft_external_id
      t.integer :external_status
      t.integer :course_type
      t.integer :enrollments_count
      t.integer :domain_id, limit: 8
      t.datetime :deleted_at
      t.integer :attachments_count
      t.integer :sub_account_id, limit: 8
      t.boolean :open_book
      t.string :description
      t.integer :third_party_course_id, limit: 8
      t.integer :external_course_id
      t.boolean :force_tinymce
      t.integer :quizzes_count
      t.string :external_status_message
      t.boolean :manual_estimated_time
      t.boolean :force_tinymce_importer_version
      t.boolean :show_correct_response
      t.integer :max_quiz_attempts
    end
  end
end
