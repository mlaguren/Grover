require './lib/grover/data_config'
require 'yaml'

RSpec.describe do
  
  before :all do
    FileUtils.cp("./configuration/grover.yml.template", "./configuration/grover.yml")
    FileUtils.cp("./configuration/grover.yml.template", "./configuration/custom.yml")
    FileUtils.cp("./configuration/error.yml.template", "./configuration/error.yml")
    File.open("./configuration/test.json", "w") {|f| f.write("test:  name") }
  end
  
  describe "Grover::DataConfig" do
    it "should verify that the default configuration file exists" do
      configuration = Grover::DataConfig.new
      expect(File.exists?(configuration.location)).to eq true
    end
    
    it "should verify that the custom configuration file exists" do
      configuration = Grover::DataConfig.new( {"location":"./configuration/custom.yml"})
      expect(File.exists?(configuration.location)).to eq true
    end
    
    it "should verify that the configuration file is a yaml file" do
      configuration = Grover::DataConfig.new
      expect(File.extname(configuration.location)).to eq ".yml"
    end
    
    it "should return an error message if the configuration file is not a yaml file" do
      configuration = Grover::DataConfig.new( {"location":"./configuration/test.json"})
      expect(configuration.set_config).to eq "#{configuration.location} file extension is invalid"
    end
    
    it "should contain data source setup information" do
      configuration = Grover::DataConfig.new.set_config
      expect(configuration).to have_key('SourceA')
      expect(configuration).to have_key('SourceB')
      expect(configuration['SourceA']).to have_key('type')
      expect(configuration['SourceA']).to have_key('location')
    end
    
    it "should verify that an error is thrown when the data source is not identifiable" do
      configuration = Grover::DataConfig.new({"location":"./configuration/error.yml"}).set_config
      expect(configuration).to eq 'Source not supported.'
    end
    
    xit "should verify that the configuration file is correct" do
      pending ("Logic for empty keys needs to be thought through")
    end
  end
end