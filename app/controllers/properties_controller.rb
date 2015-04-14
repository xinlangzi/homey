class PropertiesController < ApplicationController
  skip_filter :authenticate_user!
  before_action :set_property, only: [:show]

  # GET /propertys/1
  # GET /propertys/1.json
  def show
  end

  def index
    Property.sanitize_params(params) if params[:q]
    @q = Property.ransack(params[:q])
    if params[:q].present?
      @properties = @q.result(distinct: true).page(params[:page]).per(12)
    else
      @latest_properties = Property.latest
    end
    authorize Property
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.friendly.find(params[:id])
      authorize @property
    end
end
