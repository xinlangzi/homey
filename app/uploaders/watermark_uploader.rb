# encoding: utf-8

class WatermarkUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  process :add_watermark => "homeyagency.com"

  def add_watermark(text)
    manipulate! do |img|
      # idea came from https://adityashedge.wordpress.com/2015/01/11/watermarking-images-with-imagemagick/
      mark = Magick::Image.new(img.rows, img.columns) {self.background_color = "none"}
      draw = Magick::Draw.new

      draw.annotate(mark, 0, 0, 0, 0, text) do
        draw.gravity = Magick::CenterGravity
        draw.pointsize = 35
        draw.font_family = "Times" # set font
        draw.fill = "black" # set text color
        draw.stroke = "none" # remove stroke
      end

      # mark = mark.rotate(-45)
      img.composite!(mark, Magick::CenterGravity, Magick::SoftLightCompositeOp)
    end
  end
end
