class AddIndexToEnrollmentProfile < ActiveRecord::Migration[5.1]
  def change
    return unless BridgeCache.use_internal_database
    add_index :bridge_cache_enrollment_profiles, :config, using: :gin
  end
end
