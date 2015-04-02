class Backend::PhotosController < ApplicationController
  before_action :set_photo, only: [:destroy]

  # POST /backend/photos
  # POST /backend/photos.json
  def create
    @photo = Photo.new(photo_params)
    authorize @photo

    respond_to do |format|
      if @photo.save
        format.json { render json: "success", status: :created }
      else
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/photos/1
  # DELETE /backend/photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
      authorize @photo
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:rental_unit_id, :file)
    end
end
