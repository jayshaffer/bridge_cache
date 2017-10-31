module BridgeCache
  class Program < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    belongs_to :domain, foreign_key: :domain_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    belongs_to :sub_account, foreign_key: :sub_account_id, primary_key: :bridge_id, class_name: 'BridgeCache::Domain', optional: true
    has_many :program_items, foreign_key: :program_id, primary_key: :bridge_id, class_name: 'BridgeCache::ProgramItem'
    has_many :program_enrollments, foreign_key: :program_id, primary_key: :bridge_id, class_name: 'BridgeCache::ProgramEnrollment'
    has_many :program_group_enrollments, foreign_key: :program_id, primary_key: :bridge_id, class_name: 'BridgeCache::ProgramGroupEnrollment'
    has_many :affiliated_sub_accounts, primary_key: :bridge_id, class_name: 'BridgeCache::AffiliatedSubAccount', as: :item
    has_many :domains, through: :affiliated_sub_accounts

    def self.for_domain(domain_id)
      includes(:domains)
      .where('bridge_cache_affiliated_sub_accounts.domain_id = ? OR bridge_cache_programs.sub_account_id = ?', domain_id, domain_id)
      .references(:domains)
    end

  end
end
