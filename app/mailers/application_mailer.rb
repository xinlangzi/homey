class ApplicationMailer < ActionMailer::Base
  default from: "info@homeyagency.com"
  layout 'mailer'
  
  def new_inquiry(inquiry_id)
    @inquiry = Inquiry.find(inquiry_id)
    mail(to: System.first.email, subject: "Prospective Customer Left Inquiry")
  end
  
  def new_request(request_id)
    @request = Request.find(request_id)
    mail(to: System.first.email, subject: "Prospective Customer Left Request")
  end
end
