module BridgeCache
  class Tag < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    has_many :taggings, foreign_key: :tag_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Tagging.name

  end
end
