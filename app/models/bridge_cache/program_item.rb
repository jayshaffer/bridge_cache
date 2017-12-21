module BridgeCache
  class ProgramItem < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    belongs_to :program, foreign_key: :program_id, primary_key: BridgeCache.primary_key, class_name: 'BridgeCache::Program', optional: true

    def self.for_domain(domain_id)
      joins(:program).merge(BridgeCache::Program.for_domain(domain_id))
    end

  end
end
