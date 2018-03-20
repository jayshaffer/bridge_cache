class AddIndexToEnrollmentProfile < ActiveRecord::Migration[5.1]
  def change
    add_index :bridge_cache_enrollment_profiles, :config, using: :gin
  end
end
