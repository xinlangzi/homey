class PagesController < ApplicationController
  skip_filter :authenticate_user!

  def home
    @q = Property.ransack(params[:q])
    @latest_properties = Property.latest
    @latest_news = NewsItem.latest
    @subleases = Sublease.latest
  end

end