require './lib/grover/data_config'

RSpec.describe Grover::DataConfig do
  describe "#readme" do
    it "should verify that the configuration file exists" do
      configuration = Grover::DataConfig.new
      expect(configuration.location).to_not be_ni
    end
  end
end