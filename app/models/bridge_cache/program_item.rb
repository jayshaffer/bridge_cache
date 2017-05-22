module BridgeCache
  class ProgramItem < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :program, foreign_key: :program_id, primary_key: :bridge_id, class_name: 'BridgeCache::Program', optional: true

  end
end
