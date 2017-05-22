module BridgeCache
  class Tagging < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :tag, foreign_key: :tag_id, primary_key: :bridge_id, class_name: 'BridgeCache::Tag', optional: true
    belongs_to :user, foreign_key: :tagger_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true

  end
end
