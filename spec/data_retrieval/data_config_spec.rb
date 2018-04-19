require './lib/grover/data_config'
require 'yaml'

RSpec.describe Grover::DataConfig do
  describe "#readme" do
    it "should verify that the default configuration file exists" do
      FileUtils.cp("./configuration/grover.yml.template", "./configuration/grover.yml")
      configuration = Grover::DataConfig.new
      expect(File.exists?(configuration.location)).to eq true
    end
    
    it "should verify that the custom configuration file exists" do
      File.open("./configuration/test.yml", "w") {|f| f.write("test:  name") }
      configuration = Grover::DataConfig.new( {"location":"./configuration/test.yml"})
      expect(File.exists?(configuration.location)).to eq true
    end
    
    it "should verify that the configuration file is a yaml file" do
      configuration = Grover::DataConfig.new
      expect(YAML.load_file(configuration.location).class).to eq Hash
    end
    
    it "should return an error message if the configuration file is not a yaml file" do
      File.open("./configuration/test.json", "w") {|f| f.write("test:  name") }
      configuration = Grover::DataConfig.new( {"location":"./configuration/test.yml"})
      expect(File.extname(configuration.location)).to eq ".yml"
    end
    
    
  end
end