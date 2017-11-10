require 'spec_helper'

describe BridgeCache::Plugins::CSVDump do
  before(:each) do
    @dir = Dir.mktmpdir
    zip_folder_path = "#{File.dirname(__FILE__)}/../../../fixtures/bulk"
    input_filenames = [
      'learner_custom_field_values.csv'
    ]

    @zipfile_name = "#{@dir}/dump.zip"

    Zip::File.open(@zipfile_name, Zip::File::CREATE) do |zipfile|
      input_filenames.each do |filename|
        zipfile.add(filename, zip_folder_path + '/' + filename)
      end
    end
  end

  describe '#bulk_import' do
    it 'import a csv in bulk' do
      import = BridgeBlueprint::DataDump.new(@zipfile_name)
      expect(BridgeCache::CustomField.count).to(eq(0))
      BridgeCache::Plugins::CSVDump.bulk_import(import, 'learner_custom_field_value')
      expect(BridgeCache::LearnerCustomFieldValue.count).to(eq(500_000))
    end
  end
end
