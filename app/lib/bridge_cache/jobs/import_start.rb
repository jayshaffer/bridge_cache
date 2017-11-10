module BridgeCache::Jobs
  class ImportStart < ActiveJob::Base
    queue_as :default

    def perform(account_settings, chain = [])
      data = BridgeBlueprint::RemoteData.new(account_settings[:url], account_settings[:api_key], account_settings[:api_secret])
      data.start_data_report
      BridgeCache::Jobs::ImportCheck
        .set(queue: queue_name, wait: 30.seconds)
        .perform_later(
          account_settings,
          0,
          chain
        )
    end
  end
end
