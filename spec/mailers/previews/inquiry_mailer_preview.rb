# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class InquiryMailerPreview < ActionMailer::Preview
  def prospective_customer
    inquiry = Inquiry.first
    InquiryMailer.prospective_customer(inquiry.id)
  end
end
