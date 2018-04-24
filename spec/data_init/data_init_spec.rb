require './lib/grover/data_init'
require 'yaml'
require 'csv'

RSpec.describe do
  before :all do
    FileUtils.cp("./configuration/grover.yml.template", "./configuration/grover.yml")
  end
  
  describe "Grover::DataInit" do
    it "should create the folders" do
      folder = Grover::DataInit.new('./configuration/grover.yml')
      folder.setup
      expect(File.directory? "./data/#{folder.epoch}").to eq true
    end
    
    it "should provide an error if the file is not in the location" do
      expect(Grover::DataInit.new('./configuration/error.yml').download_data("SourceB")).to eq "File is not in given location"
    end
    
    it "should copy the source csv data to the appropriate epoch folder" do
      file = Grover::DataInit.new('./configuration/grover.yml')
      file.download_data("SourceA")
      expect(File.exists?("./data/#{file.epoch}/SourceA.csv")).to eq true
    end
    
    xit "should copy source files in parallel" do
    end
  end
end