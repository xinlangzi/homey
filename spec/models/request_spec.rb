require 'rails_helper'

RSpec.describe Request, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :mobile_phone }
  
  let(:request) { create(:request) }
  it "should create a mailer after create" do
    ActionMailer::Base.deliveries.clear
    request.reload
    expect(ActionMailer::Base.deliveries.first.subject).to eq("Prospective Customer Left Request")
  end
end
