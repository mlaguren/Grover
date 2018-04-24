require './lib/grover/data_conversion'
require 'yaml'
require 'json'
require 'csv'

RSpec.describe do
    
      describe "Grover::DataInit" do
          
        it "should convert the file to an array of hashes" do
            expect(Grover::DataConversion.new("./test_data/test.csv").to_hash.class).to eq Array
            expect(Grover::DataConversion.new("./test_data/test.csv").to_hash[0].class).to eq Hash

        end
          
      end
      
    
end
