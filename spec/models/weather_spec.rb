describe Weather do
  describe ".fetch" do
    it "should fetch the weather" do
      VCR.use_cassette("weather") do
        Weather.fetch
        ap Weather.default
      end
    end
  end
end
