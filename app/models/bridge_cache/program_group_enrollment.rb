module BridgeCache
  class ProgramGroupEnrollment < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    belongs_to :group, foreign_key: :group_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Group.name, optional: true
    belongs_to :program, foreign_key: :program_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Program.name, optional: true

  end
end
