class Captcha < ActiveRecord::Base
  scope :random, -> { order("random()").limit(1) }

  def self.fetch_new
    return unless Captcha.count < 1000
    captcha = JSON.parse(open("http://api.textcaptcha.com/homeyagency.com.json").read)
    Captcha.create!(question: captcha["q"], answer: captcha["a"].to_s)
  end
end