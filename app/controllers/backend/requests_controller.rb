class Backend::RequestsController < Backend::BaseController
  before_action :set_request, only: [:destroy, :show]

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.all
    authorize Request
  end

  def show
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to backend_requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
      authorize @request
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params[:request]
    end
end
