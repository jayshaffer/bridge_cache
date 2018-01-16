module BridgeCache::Jobs
  class ImportStart < ActiveJob::Base
    queue_as :default

    def perform(bridge_base_url, bridge_api_key, bridge_api_secret, models, chain = [], global_options = {})
      begin
        data = BridgeBlueprint::RemoteData.new(bridge_base_url, bridge_api_key, bridge_api_secret)
        models = (['domain', 'affiliated_sub_account'] + models).uniq unless global_options[:subaccount]
        data.start_data_report
        BridgeCache::Jobs::ImportCheck
          .set(queue: self.queue_name, wait: 30.seconds)
          .perform_later(
            bridge_base_url,
            bridge_api_key,
            bridge_api_secret,
            models,
            0,
            chain,
            global_options
          )
      rescue => e
        Rails.logger.debug(e)
      end
    end
  end
end
