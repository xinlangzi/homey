require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  let(:inquiry) { create(:inquiry) }
  it "should create a mailer after create" do
    Sidekiq::Worker.jobs.clear
    inquiry.reload
    jobs = Sidekiq::Worker.jobs
    expect(jobs.length).to eq(1)
    job = jobs[ActiveJob::QueueAdapters::SidekiqAdapter::JobWrapper].first
    expect(job["at"].to_f - job["enqueued_at"].to_f).to eq(60.0)
    args = job["args"].first["arguments"]
    expect(args[0..1] << args[3]).to eq(["ApplicationMailer", "new_inquiry", inquiry.id])
  end
end
