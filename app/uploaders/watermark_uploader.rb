# encoding: utf-8

class WatermarkUploader < CarrierWave::Uploader::Base
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :add_watermark => "homeyagency.com"

  def add_watermark(text)
    manipulate! do |img|
      img.combine_options do |cmd|
        cmd.gravity 'center'
        cmd.draw 'text 0,0 "homeyagency.com"'
        cmd.pointsize "35"
      end

      img
    end
  end
end
