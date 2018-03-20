module BridgeCache
  class AffiliatedSubAccount < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    before_save :fix_item_type

    belongs_to :item, polymorphic: true, optional: true
    belongs_to :domain, foreign_key: :domain_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true

    private

    def fix_item_type
      self.item_type = "BridgeCache::#{self.item_type}" unless self.item_type&.starts_with?("BridgeCache::")
    end

    def self.cleanup(current_row_ids)
      BridgeCache::AffiliatedSubAccount.where.not(bridge_id: current_row_ids).destroy_all
    end

  end
end
