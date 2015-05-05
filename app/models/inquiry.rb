class Inquiry < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :comment, presence: true
  
  after_create do
    ApplicationMailer.new_inquiry(self.id).deliver_later(wait: 1.minute)
  end
end
