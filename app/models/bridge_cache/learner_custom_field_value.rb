module BridgeCache
  class LearnerCustomFieldValue < ApplicationRecord
    extend BridgeCache::Data::BridgeModel

    def self.for_domain(domain_id)
      joins(:user).where(bridge_cache_users: {domain_id: domain_id})
    end

    belongs_to :user, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::User.name, optional: true
    belongs_to :custom_field, foreign_key: :custom_field_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::CustomField.name, optional: true

  end
end
