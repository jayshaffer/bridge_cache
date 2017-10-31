class AddIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index :bridge_cache_domains, :bridge_id
    add_index :bridge_cache_domains, :parent_id
    add_index :bridge_cache_domains, :owner_id

    add_index :bridge_cache_users, :bridge_id
    add_index :bridge_cache_users, :domain_id
    add_index :bridge_cache_users, :sub_account_id

    add_index :bridge_cache_programs, :bridge_id
    add_index :bridge_cache_programs, :domain_id
    add_index :bridge_cache_programs, :sub_account_id
    add_index :bridge_cache_programs, :external_id

    add_index :bridge_cache_custom_fields, :bridge_id
    add_index :bridge_cache_custom_fields, :domain_id

    add_index :bridge_cache_grants, :bridge_id
    add_index :bridge_cache_grants, :user_id
    add_index :bridge_cache_grants, :domain_id

    add_index :bridge_cache_enrollments, :bridge_id
    add_index :bridge_cache_enrollments, :user_id
    add_index :bridge_cache_enrollments, :course_template_id

    add_index :bridge_cache_groups, :bridge_id
    add_index :bridge_cache_groups, :parent_id
    add_index :bridge_cache_groups, :domain_id

    add_index :bridge_cache_program_items, :bridge_id
    add_index :bridge_cache_program_items, :program_id
    add_index :bridge_cache_program_items, :item_id
    add_index :bridge_cache_program_items, :item_type

    add_index :bridge_cache_program_enrollments, :bridge_id
    add_index :bridge_cache_program_enrollments, :user_id
    add_index :bridge_cache_program_enrollments, :program_id

    add_index :bridge_cache_program_group_enrollments, :bridge_id
    add_index :bridge_cache_program_group_enrollments, :group_id
    add_index :bridge_cache_program_group_enrollments, :program_id

    add_index :bridge_cache_tags, :bridge_id

    add_index :bridge_cache_taggings, :bridge_id
    add_index :bridge_cache_taggings, :tag_id
    add_index :bridge_cache_taggings, :taggable_id
    add_index :bridge_cache_taggings, :tagger_id

    add_index :bridge_cache_course_templates, :bridge_id
    add_index :bridge_cache_course_templates, :user_id
    add_index :bridge_cache_course_templates, :domain_id
    add_index :bridge_cache_course_templates, :sub_account_id
    add_index :bridge_cache_course_templates, :third_party_course_id

    add_index :bridge_cache_group_enrollments, :bridge_id
    add_index :bridge_cache_group_enrollments, :group_id
    add_index :bridge_cache_group_enrollments, :course_template_id

    add_index :bridge_cache_memberships, :bridge_id
    add_index :bridge_cache_memberships, :group_id
    add_index :bridge_cache_memberships, :user_id

    add_index :bridge_cache_learner_custom_field_values, :bridge_id
    add_index :bridge_cache_learner_custom_field_values, :custom_field_id, name: 'index_bclcfv_on_custom_field_id'
    add_index :bridge_cache_learner_custom_field_values, :user_id

    add_index :bridge_cache_affiliated_sub_accounts, :bridge_id
    add_index :bridge_cache_affiliated_sub_accounts, :item_id
    add_index :bridge_cache_affiliated_sub_accounts, :item_type
    add_index :bridge_cache_affiliated_sub_accounts, :domain_id

    add_index :bridge_cache_live_courses, :bridge_id
    add_index :bridge_cache_live_courses, :user_id
    add_index :bridge_cache_live_courses, :domain_id
    add_index :bridge_cache_live_courses, :sub_account_id
    add_index :bridge_cache_live_courses, :external_course_id

    add_index :bridge_cache_live_course_enrollments, :bridge_id
    add_index :bridge_cache_live_course_enrollments, :live_course_id
    add_index :bridge_cache_live_course_enrollments, :user_id

    add_index :bridge_cache_live_course_session_registrations, :bridge_id, name: 'index_bclcsr_on_bridge_id'
    add_index :bridge_cache_live_course_session_registrations, :live_course_session_id, name: 'index_bclcsr_on_live_course_session_id'
    add_index :bridge_cache_live_course_session_registrations, :user_id, name: 'index_bclcsr_on_user_id'
    add_index :bridge_cache_live_course_session_registrations, :live_course_enrollment_id, name: 'index_bclcsr_on_live_course_enrollment_id'

    add_index :bridge_cache_live_course_sessions, :bridge_id
    add_index :bridge_cache_live_course_sessions, :live_course_id
    add_index :bridge_cache_live_course_sessions, :domain_id
    add_index :bridge_cache_live_course_sessions, :sub_account_id
    add_index :bridge_cache_live_course_sessions, :parent_id

  end
end
