module BridgeCache
  class Tag < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    has_many :taggings, foreign_key: :tag_id, primary_key: :bridge_id, class_name: 'BridgeCache::Tagging'

  end
end
