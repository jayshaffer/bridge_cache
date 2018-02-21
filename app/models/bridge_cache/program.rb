module BridgeCache
  class Program < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    belongs_to :domain, foreign_key: :domain_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
    belongs_to :sub_account, foreign_key: :sub_account_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
    has_many :program_items, foreign_key: :program_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::ProgramItem.name
    has_many :program_enrollments, foreign_key: :program_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::ProgramEnrollment.name
    has_many :program_group_enrollments, foreign_key: :program_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::ProgramGroupEnrollment.name
    has_many :affiliated_sub_accounts, primary_key: BridgeCache.primary_key, class_name: BridgeCache::AffiliatedSubAccount.name, as: :item
    has_many :domains, through: :affiliated_sub_accounts

    def self.for_domain(domain_id)
      includes(:domains)
      .where('bridge_cache_affiliated_sub_accounts.domain_id = ? OR bridge_cache_programs.sub_account_id = ?', domain_id, domain_id)
      .references(:domains)
    end

  end
end
