require 'json'
require 'open-uri'

class Weather < ActiveRecord::Base
  def self.fetch
    my_hash = JSON.parse(open("http://api.openweathermap.org/data/2.5/weather?id=1790645&units=metric&APPID=#{Rails.application.secrets.weather_api_id}").read)
    temp = my_hash["main"]["temp"].to_f
    default.update_attributes!(temp_c: temp.round, temp_f: (temp * 1.8 + 32).round, icon: my_hash["weather"].first["icon"])
  end
  
  def self.default
    Weather.first || init
  end

  def self.init
    weather = Weather.new
    weather.save(validate: false)
    weather
  end
end
