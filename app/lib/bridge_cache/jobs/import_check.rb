module BridgeCache::Jobs
  class ImportCheck < ActiveJob::Base
    queue_as :default
    include BridgeCache::Utils::WorkerHelper

    ATTEMPTS_THRESHOLD = 30

    def perform(bridge_base_url, bridge_api_key, bridge_api_secret, models, attempts, chain = [], global_options = {})
      remote_data = BridgeBlueprint::RemoteData.new(bridge_base_url, bridge_api_key, bridge_api_secret)
      if attempts > ATTEMPTS_THRESHOLD
        Rails.logger.fatal("Bridge data dump failed to download after #{(ATTEMPTS_THRESHOLD * 30) / 60} minutes")
      elsif remote_data.status == BridgeBlueprint::Constants::STATUS_COMPLETE
        BridgeCache::Jobs::ImportData.set(queue: self.queue_name).perform_later(bridge_base_url, bridge_api_key, bridge_api_secret, models, chain, global_options)
      elsif remote_data.status == BridgeBlueprint::Constants::STATUS_PENDING
        BridgeCache::Jobs::ImportCheck.set(queue: self.queue_name, wait: 30.seconds).perform_later(bridge_base_url, bridge_api_key, bridge_api_secret, models, attempts + 1, chain, global_options)
      elsif remote_data.status == BridgeBlueprint::Constants::STATUS_FAILED || remote_data.status == BridgeBlueprint::Constants::STATUS_NOT_FOUND
        raise 'Bridge data dump download failed'
      end
    end
  end
end
