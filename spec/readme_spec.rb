require './lib/readme'

RSpec.describe Readme do
  describe "#readme" do
    it "is in the appropriate location" do
      readme = Readme.new
      expect(readme.there).to eq(true)
    end
  end
end