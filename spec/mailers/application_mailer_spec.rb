require "rails_helper"

RSpec.describe ApplicationMailer, type: :mailer do
  describe "new_inquiry" do
    let!(:inquiry) { create(:inquiry) }
    it "create email" do
      email = ApplicationMailer.new_inquiry(inquiry.id)
      expect(email.to).to eq(["info@homeyagency.com"])
      expect(email.from).to eq(["info@homeyagency.com"])
      expect(email.subject).to eq("Prospective Customer Left Inquiry")
    end
  end
  
  describe "new_request" do
    let!(:request) { create(:request) }
    it "create email" do
      email = ApplicationMailer.new_request(request.id)
      expect(email.to).to eq(["info@homeyagency.com"])
      expect(email.from).to eq(["info@homeyagency.com"])
      expect(email.subject).to eq("Prospective Customer Left Request")
    end
  end
end
