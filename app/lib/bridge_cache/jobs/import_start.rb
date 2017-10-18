module BridgeCache::Jobs
  class ImportStart < ActiveJob::Base
    queue_as :default

    def perform(bridge_base_url, bridge_api_key, bridge_api_secret, models, chain = [])
      data = BridgeBlueprint::RemoteData.new(bridge_base_url, bridge_api_key, bridge_api_secret)
      models = (['domain', 'affiliated_sub_account'] + models).uniq
      data.start_data_report
      BridgeCache::Jobs::ImportCheck
        .set(queue: self.queue_name, wait: 30.seconds)
        .perform_later(
          bridge_base_url,
          bridge_api_key,
          bridge_api_secret,
          models,
          chain
        )
    end
  end
end
