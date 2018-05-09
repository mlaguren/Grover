require './lib/grover/basic_comparisons'

RSpec.describe do 
   describe "Grover::BasicComparison" do
       it "should return success message if both sources have the same number of rows" do
           expect(Grover::BasicComparisons.new('./test_data/results.json','./test_data/rows_match.json').equal_rows?).to eq true
       end
       
       it "should return a mismatch message if both sources do not have the same number of rows" do
           expect(Grover::BasicComparisons.new('./test_data/results.json','./test_data/rows_mismatch.json').equal_rows?).to eq false
           
       end
       
       it "should return an empty array when the data matches" do
           expect(Grover::BasicComparisons.new('./test_data/results.json','./test_data/results.json').does_not_exists).to eq [[], []]
       end

       it "should the row that's in A that is not in B" do
           expect(Grover::BasicComparisons.new('./test_data/results.json','./test_data/rows_mismatch.json').does_not_exists).to eq [[{"id"=>"25","first_name"=>"Courtnay","last_name"=>"Caslake","email"=>"ccaslakeo@tumblr.com","gender"=>"Male","ip_address"=>"48.49.120.107"}],[]]
       end       
       
       it "should the row that's in B that is not in A" do
           expect(Grover::BasicComparisons.new('./test_data/rows_mismatch.json', './test_data/results.json').does_not_exists).to eq [[],[{"id"=>"25","first_name"=>"Courtnay","last_name"=>"Caslake","email"=>"ccaslakeo@tumblr.com","gender"=>"Male","ip_address"=>"48.49.120.107"}]]
       end  
       
   end
end