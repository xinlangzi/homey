class PropertiesController < ApplicationController
  before_action :set_property, only: [:show]

  # GET /propertys/1
  # GET /propertys/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.friendly.find(params[:id])
      authorize @property
    end
end
