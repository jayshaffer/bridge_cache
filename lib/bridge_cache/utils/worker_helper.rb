module BridgeCache::Utils
  module WorkerHelper
    def self.invoke_next(job_chain, params = [])
      job_chain ||= []
      job = job_chain.shift
      if job
        job_class = Object.const_get(job[:job].classify)
        job_class.perform_later(*(job[:params].concat(params)))
      end
    end
  end
end
