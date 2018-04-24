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
    
    xit "should be able to retrieve a csv file" do
      file = Grover::DataInit.new('./configuration/grover.yml').download_data("SourceA")
      
    end
  end
end