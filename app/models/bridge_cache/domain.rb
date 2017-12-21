module BridgeCache
  class Domain < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    has_many :domain_children, primary_key: 'bridge_id', foreign_key: 'parent_id', class_name: 'BridgeCache::Domain'
    belongs_to :domain_parent, primary_key: 'bridge_id', foreign_key: 'parent_id', class_name: 'BridgeCache::Domain', optional: true

    has_many :domain_ownees, primary_key: 'bridge_id', foreign_key: 'owner_id', class_name: 'BridgeCache::Domain'
    belongs_to :domain_owner, primary_key: 'bridge_id', foreign_key: 'owner_id', class_name: 'BridgeCache::Domain', optional: true

    has_many :programs, primary_key: 'bridge_id', foreign_key: 'domain_id', class_name: 'BridgeCache::Program'
    has_many :course_templates, primary_key: 'bridge_id', foreign_key: 'domain_id', class_name: 'BridgeCache::CourseTemplate'
    has_many :custom_fields, primary_key: 'bridge_id', foreign_key: 'domain_id', class_name: 'BridgeCache::CustomField'
    has_many :grants, primary_key: 'bridge_id', foreign_key: 'domain_id', class_name: 'BridgeCache::Grant'

    serialize :config

  end
end
