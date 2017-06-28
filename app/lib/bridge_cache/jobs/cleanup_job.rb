module BridgeCache::Jobs
  class CleanupJob < ActiveJob::Base
    def perform(model, row_ids)
      "BridgeCache::#{model.camelcase}".constantize.cleanup(row_ids)
    end
  end
end
