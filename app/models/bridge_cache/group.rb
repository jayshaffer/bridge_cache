module BridgeCache
  class Group < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    self.inheritance_column = nil

    belongs_to :user, foreign_key: :user_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::User.name, optional: true
    has_many :program_group_enrollments, foreign_key: :group_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::ProgramGroupEnrollment.name
    has_many :group_enrollments, foreign_key: :group_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::GroupEnrollment.name
    has_many :memberships, foreign_key: :group_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Membership.name
    belongs_to :domain, foreign_key: :domain_id, primary_key: BridgeCache.primary_key, class_name: BridgeCache::Domain.name, optional: true
  end
end
