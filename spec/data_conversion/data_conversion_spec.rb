require './lib/grover/data_conversion'
require 'yaml'
require 'json'
require 'csv'

RSpec.describe do
    
      describe "Grover::DataConversion" do
          
        it "should convert the file to an array of hashes" do
            expect(Grover::DataConversion.new("./test_data/test.csv").to_hash.class).to eq Array
            expect(Grover::DataConversion.new("./test_data/test.csv").to_hash[0].class).to eq Hash
        end
        
        it "should create a json file in a temporary folder" do
            epoch = Time.now.to_i
            Grover::DataConversion.new("./test_data/test.csv").to_json_file(epoch)
            expect(File.exists?("./tmp/#{epoch}/test.json")).to eq true
        end
          
      end
      
    
end
