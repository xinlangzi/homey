class Inquiry < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :comment, presence: true
  
  attr_accessor :captcha_response, :captcha_question

  after_create do
    ApplicationMailer.new_inquiry(self.id).deliver_later(wait: 1.minute)
  end

  def property
    Property.friendly.find(property_id.downcase)
  end
end
