require 'spec_helper'

describe BridgeCache::Jobs::CleanupJob do
  describe '#perform' do
    it 'calls the cleanup method on the model' do
      expect(BridgeCache::Tagging).to receive(:cleanup).with([1,2])
      BridgeCache::Jobs::CleanupJob.perform_now('tagging', [1,2])
    end
  end
end
