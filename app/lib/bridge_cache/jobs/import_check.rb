module BridgeCache::Jobs
  class ImportCheck < ActiveJob::Base
    queue_as :default
    include BridgeCache::Utils::WorkerHelper

    ATTEMPTS_THRESHOLD = 30

    def perform(account_settings, attempts, chain = [])
      account_settings = account_settings.with_indifferent_access
      remote_data = BridgeBlueprint::RemoteData.new(account_settings[:url], account_settings[:api_key], account_settings[:api_secret])
      if attempts > ATTEMPTS_THRESHOLD
        Rails.logger.fatal("Bridge data dump failed to download after #{(ATTEMPTS_THRESHOLD * 30) / 60} minutes")
      elsif remote_data.status == BridgeBlueprint::Constants::STATUS_COMPLETE
        BridgeCache::Jobs::ImportData.set(queue: queue_name).perform_later(account_settings, chain)
      elsif remote_data.status == BridgeBlueprint::Constants::STATUS_PENDING
        BridgeCache::Jobs::ImportCheck.set(queue: queue_name, wait: 30.seconds).perform_later(account_settings, attempts + 1, chain)
      elsif remote_data.status == BridgeBlueprint::Constants::STATUS_FAILED || remote_data.status == BridgeBlueprint::Constants::STATUS_NOT_FOUND
        raise 'Bridge data dump download failed'
      end
    end
  end
end
