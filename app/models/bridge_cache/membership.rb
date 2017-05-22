module BridgeCache
  class Membership < ApplicationRecord
    extend BridgeCache::Data::BridgeModel

    belongs_to :group, foreign_key: :group_id, primary_key: :bridge_id, class_name: 'BridgeCache::Group', optional: true
    belongs_to :user, foreign_key: :group_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true

  end
end
