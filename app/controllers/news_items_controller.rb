class NewsItemsController < ApplicationController
  before_action :set_news_item, only: [:show]

  # GET /news_items/1
  # GET /news_items/1.json
  def show
  end

  # GET /news_items
  # GET /news_items.json
  def index
    @news_items = NewsItem.order("created_at desc").page(params[:page]).per(5)
    authorize NewsItem    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_item
      @news_item = NewsItem.find(params[:id])
      authorize @news_item
    end
end
