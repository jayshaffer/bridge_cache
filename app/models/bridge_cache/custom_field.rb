module BridgeCache
  class CustomField < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    belongs_to :domain, foreign_key: :domain_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
    has_many :learner_custom_field_values, primary_key: BridgeCache.primary_key, foreign_key: :custom_field_id, class_name: BridgeCache::LearnerCustomFieldValue.name
  end
end
