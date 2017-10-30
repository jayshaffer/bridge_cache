module BridgeCache
  class ProgramEnrollment < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :user, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true
    belongs_to :program, foreign_key: :program_id, primary_key: :bridge_id, class_name: 'BridgeCache::Program', optional: true

    def self.for_domain(domain_id)
      joins(:program).merge(BridgeCache::Program.for_domain(domain_id))
    end

  end
end
