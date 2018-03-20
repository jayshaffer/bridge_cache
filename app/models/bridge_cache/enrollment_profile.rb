module BridgeCache
  class EnrollmentProfile < BridgeBaseModel
    extend BridgeCache::Data::BridgeModel

    belongs_to :enrollable, primary_key: BridgeCache.primary_key, polymorphic: true
    before_validation :namespace_enrollable_type
    before_save :parse_json

    def namespace_enrollable_type
      self.enrollable_type = "BridgeCache::#{self.enrollable_type}" unless self.enrollable_type&.include? 'BridgeCache::'
    end

    def parse_json
      json = BridgeCache::Plugins::DataTransform::valid_json?(self.config)
      self.config = json if json.present?
    end

  end
end
