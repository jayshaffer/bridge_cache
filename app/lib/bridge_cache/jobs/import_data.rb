module BridgeCache::Jobs
  class ImportData < ActiveJob::Base
    include BridgeCache::Utils::WorkerHelper
    queue_as :default

    def perform(account_settings, chain = [])
      account_settings = account_settings.with_indifferent_access
      remote_data = BridgeBlueprint::RemoteData.new(account_settings[:url], account_settings[:api_key], account_settings[:api_secret])
      Dir.mktmpdir do |dir|
        path = "#{dir}/data_dump"
        remote_data.store_file(path)
        import = BridgeBlueprint::DataDump.new(path)
        BridgeCache.resolved_models(account_settings[:is_subaccount]).each do |model|
          ids = []
          ids << BridgeCache::Plugins::CSVDump.bulk_import(import, model)
          BridgeCache::Jobs::CleanupJob.set(queue: queue_name).perform_later(model, ids)
        end
      end
      BridgeCache::Utils::WorkerHelper.invoke_next(chain)
    end
  end
end
