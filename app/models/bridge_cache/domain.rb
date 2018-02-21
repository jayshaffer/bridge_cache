module BridgeCache
  class Domain < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    has_many :domain_children, primary_key: BridgeCache.primary_key, foreign_key: PARENT_ID, class_name: BridgeCache::Domain.name
    belongs_to :domain_parent, primary_key: BridgeCache.primary_key, foreign_key: PARENT_ID, class_name: BridgeCache::Domain.name, optional: true

    has_many :domain_ownees, primary_key: BridgeCache.primary_key, foreign_key: OWNER_ID, class_name: BridgeCache::Domain.name
    belongs_to :domain_owner, primary_key: BridgeCache.primary_key, foreign_key: OWNER_ID, class_name: BridgeCache::Domain.name, optional: true

    has_many :programs, primary_key: BridgeCache.primary_key, foreign_key: DOMAIN_ID, class_name: BridgeCache::Program.name
    has_many :course_templates, primary_key: BridgeCache.primary_key, foreign_key: DOMAIN_ID, class_name: BridgeCache::CourseTemplate.name
    has_many :custom_fields, primary_key: BridgeCache.primary_key, foreign_key: DOMAIN_ID, class_name: BridgeCache::CustomField.name
    has_many :grants, primary_key: BridgeCache.primary_key, foreign_key: DOMAIN_ID, class_name: BridgeCache::Grant.name

    belongs_to :owner, class_name: BridgeCache::User.name

    serialize :config

  end
end
