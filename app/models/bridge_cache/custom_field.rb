module BridgeCache
  class CustomField < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :domain, foreign_key: :domain_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    has_many :learner_custom_field_values, foreign_key: :custom_field_id, class_name: 'BridgeCache::LearnerCustomFieldValue'

  end
end
