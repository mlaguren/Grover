require './lib/grover/basic_comparisons'

RSpec.describe do 
   describe "Grover::BasicComparisons" do
       it "should return success message if both sources have the same number of rows" do
           expect(Grover::BasicComparisons.new('./test_data/results.json','./test_data/rows_match.json').equal_rows?).to eq true
       end
       
       it "should return a mismatch message if both sources do not have the same number of rows" do
           expect(Grover::BasicComparisons.new('./test_data/results.json','./test_data/rows_mismatch.json').equal_rows?).to eq false
           
       end
       
       it "should return nothing" do
           expect(Grover::BasicComparisons.new('./test_data/results.json','./test_data/rows_mismatch.json').source_delta).to eq false
       end
       
   end
end