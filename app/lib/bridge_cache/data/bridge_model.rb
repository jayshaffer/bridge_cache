module BridgeCache::Data
  module BridgeModel
    def import_from_csv(file_path)
      BridgeCache::Plugins::CSVDump::dump_to_table(self, file_path)
    end

    def create_from_csv_row(row)
      BridgeCache::Plugins::CSVDump::dump_row(self, row)
    end
  end
end
