module BridgeCache
  class Membership < ApplicationRecord
    extend BridgeCache::Data::BridgeModel

    belongs_to :group, foreign_key: :group_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Group', optional: true
    belongs_to :user, foreign_key: :group_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::User', optional: true

    def self.for_domain(domain_id)
      joins(:group).where(bridge_cache_groups: {domain_id: domain_id})
    end

  end
end
