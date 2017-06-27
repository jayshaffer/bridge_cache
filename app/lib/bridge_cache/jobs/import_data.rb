module BridgeCache::Jobs
  class ImportData < ActiveJob::Base
    include BridgeCache::Utils::WorkerHelper
    queue_as :default

    def perform(bridge_base_url, bridge_api_key, bridge_api_secret, models, chain = [])
      remote_data = BridgeBlueprint::RemoteData.new(bridge_base_url, bridge_api_key, bridge_api_secret)
      Dir.mktmpdir do |dir|
        path = "#{dir}/data_dump"
        remote_data.store_file(path)
        import = BridgeBlueprint::DataDump.new(path)
        models.each do |model|
          import.each_row(model.pluralize) do |row|
            BridgeCache::Jobs::ImportRow.set(queue: self.queue_name).perform_later(model, row.to_h)
          end
        end
      end

      WorkerHelper.invoke_next(chain)
    end
  end
end
