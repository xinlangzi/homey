class InquiryMailer < ApplicationMailer
  def prospective_customer(inquiry_id)
    @inquiry = Inquiry.find(inquiry_id)
    mail(to: System.first.email, subject: "Prospective Customer Left Inquiry")
  end
end
