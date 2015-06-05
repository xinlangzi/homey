class PropertiesController < ApplicationController
  skip_filter :authenticate_user!
  before_action :set_property, only: [:show]

  # GET /propertys/1
  # GET /propertys/1.json
  def show
  end

  def index
    @q = Property.ransack(params[:q])
    @area_desc = Area.find(params[:q][:area_id_eq]).description rescue nil
    @properties = @q.result(distinct: true).page(params[:page]).per(12)
    authorize Property
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.friendly.find(params[:id])
      authorize @property
    end
end
