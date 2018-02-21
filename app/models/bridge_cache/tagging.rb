module BridgeCache
  class Tagging < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    belongs_to :tag, foreign_key: :tag_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Tag.name, optional: true
    belongs_to :user, foreign_key: :tagger_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::User.name, optional: true

    def self.cleanup(current_row_ids)
      BridgeCache::Tagging.where.not(bridge_id: current_row_ids).destroy_all
    end
  end
end
