# Preview all emails at http://localhost:3000/rails/mailers/inquiry_mailer
class ApplicationMailerPreview < ActionMailer::Preview
  def new_inquiry
    inquiry = Inquiry.first
    ApplicationMailer.new_inquiry(inquiry.id)
  end

  def new_request
    request = Request.first
    ApplicationMailer.new_request(request.id)
  end
  
  def charge_reminder
    charge = Charge.first
    ApplicationMailer.charge_reminder(charge.id)
  end
end
