require 'rails_helper'

RSpec.describe Captcha, type: :model do
  describe ".fetch_new" do
    it "should create a new captcha" do
      VCR.use_cassette("captcha") do
        Captcha.delete_all
        Captcha.fetch_new
        c = Captcha.first
        expect(c.question).to eq("What is the 3rd digit in 915428?")
        expect(c.answer).to eq("[\"e4da3b7fbbce2345d7772b0674a318d5\", \"30056e1cab7a61d256fc8edd970d14f5\"]")
      end
    end
  end
end

