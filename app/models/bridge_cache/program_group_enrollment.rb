module BridgeCache
  class ProgramGroupEnrollment < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :group, foreign_key: :group_id, primary_key: :bridge_id, class_name: 'BridgeCache::Group', optional: true
    belongs_to :program, foreign_key: :program_id, primary_key: :bridge_id, class_name: 'BridgeCache::Program', optional: true

  end
end
