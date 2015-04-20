require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do
  let!(:inquiry) { create(:inquiry) }
  it "should do stuff" do
    email = InquiryMailer.prospective_customer(inquiry.id)
    expect(email.to).to eq(["info@homeyagency.com"])
    expect(email.from).to eq(["info@homeyagency.com"])
    expect(email.subject).to eq("Prospective Customer Left Inquiry")
  end
end
