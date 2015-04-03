class Backend::ImagesController < ApplicationController
  before_action :set_image, only: [:destroy]

  # POST /backend/images
  # POST /backend/images.json
  def create
    @image = Image.new(image_params)
    @image.user = current_user
    @image.file = params[:file]
    authorize @image
    respond_to do |format|
      if @image.save
        format.json { render json: "success", status: :created }
      else
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/images/1
  # DELETE /backend/images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
      authorize @image
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:file, :imagable_type, :imagable_id)
    end
end
