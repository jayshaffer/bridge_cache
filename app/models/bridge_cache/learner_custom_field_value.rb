module BridgeCache
  class LearnerCustomFieldValue < ApplicationRecord
    extend BridgeCache::Data::BridgeModel

    belongs_to :user, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true
    belongs_to :custom_field, foreign_key: :custom_field_id, primary_key: :bridge_id, class_name: 'BridgeCache::CustomField', optional: true

  end
end
