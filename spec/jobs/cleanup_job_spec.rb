require 'spec_helper'

describe BridgeCache::Jobs::CleanupJob do
  describe '#perform' do
    it 'calls the cleanup method on the model' do
      expect(BridgeCache::Tagging).to receive(:clenaup).with([1,2])
      CleanupJob.perform_now('tagging', [1,2])
    end
  end
end
