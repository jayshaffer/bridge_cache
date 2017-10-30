module BridgeCache::Data
  module BridgeModel

    def self.extended(base)
      base.class_eval do
        scope :in_domain, -> (domain_id) {for_domain(domain_id)}
      end
    end

    def import_from_csv(file_path)
      BridgeCache::Plugins::CSVDump::dump_to_table(self, file_path)
    end

    def create_from_csv_row(row)
      BridgeCache::Plugins::CSVDump::dump_row(self, row)
    end

    def cleanup(row_ids)
      # Implement this method in your model if you want to do any sort of post creation cleanup.
      # See tagging.rb for an example.
    end

    def webhook_updated(message)
      create_or_update_from_webhook(message)
    end

    def webhook_created(message)
      create_or_update_from_webhook(message)
    end

    def webhook_deleted(message)
      message.payload_class.where(bridge_id: message.resource_object['id']).destroy_all
    end

    def webhook_completed(message)
      raise "Method not implemented"
    end

    def for_domain(domain_id)
      where(domain_id: domain_id)
    end

    private

    def create_or_update_from_webhook(message)
      message.payload_class.create_from_csv_row(message.resource_object)
    end
  end
end
