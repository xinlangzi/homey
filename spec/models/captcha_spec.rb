require 'rails_helper'

RSpec.describe Captcha, type: :model do
  describe ".random_qa" do
    it "should create a new captcha" do
      srand(3)
      Captcha.random_qa.tap do |c|
        expect(c[:question]).to eq("10 + 3")
        expect(c[:answer]).to eq(Captcha.encode("13"))
      end
    end
  end
end

