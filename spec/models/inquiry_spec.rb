require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  let(:inquiry) { create(:inquiry) }
  it "should create a mailer after create" do
    ActionMailer::Base.deliveries.clear
    inquiry.reload
    expect(ActionMailer::Base.deliveries.first.subject).to eq("Prospective Customer Left Inquiry")
  end
end
