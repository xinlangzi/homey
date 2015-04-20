class Backend::InquiriesController < Backend::BaseController
  before_action :set_inquiry, only: [:destroy, :show]

  # GET /inquiries
  # GET /inquiries.json
  def index
    @inquiries = Inquiry.all
    authorize Inquiry
  end

  def show
  end

  # DELETE /inquiries/1
  # DELETE /inquiries/1.json
  def destroy
    @inquiry.destroy
    respond_to do |format|
      format.html { redirect_to backend_inquiries_url, notice: 'Inquiry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inquiry
      @inquiry = Inquiry.find(params[:id])
      authorize @inquiry
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params[:inquiry]
    end
end
