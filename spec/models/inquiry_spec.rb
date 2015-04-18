require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  let(:inquiry) { create(:inquiry) }
  it "should create a mailer after create" do
    Sidekiq::Worker.jobs.clear
    inquiry.reload
    jobs = Sidekiq::Worker.jobs
    expect(jobs.length).to eq(1)
    args = jobs[ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper].first["args"].first["arguments"]
    expect(args[0..1] << args[3]).to eq(["InquiryMailer", "prospective_customer", inquiry.id])
  end
end
