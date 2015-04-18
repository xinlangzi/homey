require "rails_helper"

RSpec.describe InquiryMailer, type: :mailer do
  let!(:inquiry) { create(:inquiry) }
  it "should do stuff" do
    System.find_or_create_by(email: "s@example.com")
    email = InquiryMailer.prospective_customer(inquiry.id)
    expect(email.to).to eq(["s@example.com"])
    expect(email.from).to eq(["admin@homeyagency.com"])
    expect(email.subject).to eq("Prospective Customer Left Inquiry")
  end
end
