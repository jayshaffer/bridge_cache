module BridgeCache::Jobs
  class ImportRow < ActiveJob::Base
    queue_as :default

    def perform(model, row, chain = [])
      "BridgeCache::#{model.camelcase}".constantize.create_from_csv_row(row)
    end
  end
end
