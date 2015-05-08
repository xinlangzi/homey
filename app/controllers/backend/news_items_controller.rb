class Backend::NewsItemsController < Backend::BaseController
  before_action :set_news_item, only: [:show, :edit, :update, :destroy]

  # GET /news_items
  # GET /news_items.json
  def index
    @news_items = NewsItem.all
    authorize NewsItem    
  end

  # GET /news_items/1
  # GET /news_items/1.json
  def show
  end

  # GET /news_items/new
  def new
    @news_item = NewsItem.new
    authorize @news_item
  end

  # GET /news_items/1/edit
  def edit
  end

  # POST /news_items
  # POST /news_items.json
  def create
    @news_item = NewsItem.new(news_item_params)
    authorize @news_item
    
    respond_to do |format|
      if @news_item.save
        format.html { redirect_to [:backend, @news_item], notice: 'News item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /news_items/1
  # PATCH/PUT /news_items/1.json
  def update
    respond_to do |format|
      if @news_item.update(news_item_params)
        format.html { redirect_to [:backend, @news_item], notice: 'News item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /news_items/1
  # DELETE /news_items/1.json
  def destroy
    @news_item.destroy
    respond_to do |format|
      format.html { redirect_to backend_news_items_url, notice: 'News item was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_item
      @news_item = NewsItem.find(params[:id])
      authorize @news_item
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_item_params
      params.require(:news_item).permit(:title, :content)
    end
end
