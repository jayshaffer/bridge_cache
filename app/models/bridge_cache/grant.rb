module BridgeCache
  class Grant < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    belongs_to :user, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::User', optional: true
    belongs_to :domain, foreign_key: :domain_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Domain', optional: true

  end
end
