module BridgeCache
  class Group < ActiveRecord::Base
    extend BridgeCache::Data::BridgeModel

    self.inheritance_column = nil

    belongs_to :user, foreign_key: :user_id, primary_key: :bridge_id, class_name: 'BridgeCache::User', optional: true
    has_many :program_group_enrollments, foreign_key: :group_id, primary_key: :bridge_id, class_name: 'BridgeCache::ProgramGroupEnrollment'
    has_many :group_enrollments, foreign_key: :group_id, primary_key: :bridge_id, class_name: 'BridgeCache::GroupEnrollment'
    has_many :memberships, foreign_key: :group_id, primary_key: :bridge_id, class_name: 'BridgeCache::Membership'

  end
end
