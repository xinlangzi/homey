class NewsItemsController < ApplicationController
  before_action :set_news_item, only: [:index]

  # GET /news_items/1
  # GET /news_items/1.json
  def show
    redirect_to news_items_path(id: params[:id])
  end

  # GET /news_items
  # GET /news_items.json
  def index
    @news_items = NewsItem.order("created_at desc").page(params[:page]).per(10)
    @news_item||= NewsItem.first
    authorize NewsItem
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_item
      @news_item = NewsItem.find(params[:id]) rescue nil
    end
end
