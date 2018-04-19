require './lib/grover/data_config'
require 'yaml'

RSpec.describe do
  describe "Grover::DataConfig" do
    it "should verify that the default configuration file exists" do
      FileUtils.cp("./configuration/grover.yml.template", "./configuration/grover.yml")
      configuration = Grover::DataConfig.new
      expect(File.exists?(configuration.location)).to eq true
    end
    
    it "should verify that the custom configuration file exists" do
      FileUtils.cp("./configuration/grover.yml.template", "./configuration/custom.yml")
      configuration = Grover::DataConfig.new( {"location":"./configuration/custom.yml"})
      expect(File.exists?(configuration.location)).to eq true
    end
    
    it "should verify that the configuration file is a yaml file" do
      configuration = Grover::DataConfig.new
      expect(File.extname(configuration.location)).to eq ".yml"
    end
    
    it "should return an error message if the configuration file is not a yaml file" do
      File.open("./configuration/test.json", "w") {|f| f.write("test:  name") }
      configuration = Grover::DataConfig.new( {"location":"./configuration/test.json"})
      expect(configuration.read_file).to eq "#{configuration.location} file extension is invalid"
    end
    
  end
end