module BridgeCache::Data
  module BridgeModel
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
  end
end
