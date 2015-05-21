describe Weather do
  describe ".fetch" do
    it "should fetch the weather" do
      VCR.use_cassette("weather") do
        Weather.fetch
        weather = Weather.default
        expect(weather.temp_c).to eq(19)
        expect(weather.temp_f).to eq(67)
        expect(weather.icon).to eq("10n")
      end
    end
  end
end
