class RequestsController < ApplicationController
  # GET /requests/new
  def new
    @request = Request.new
    authorize @request
  end

  # POST /requests
  def create
    @request = Request.new(request_params)
    authorize @request

    respond_to do |format|
      if @request.save
        flash.now[:notice] = "Thank you for your message. We will contact you soon!"
        format.html {  }
      else
        flash.now[:error] = "Cannot send message. Verify the following errors."
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:kind, :intention, :category, :budget_min, :budget_max, :bedroom_min, :bedroom_max, :bathroom_min, :bathroom_max, :start_of_lease, :end_of_lease, :name, :email, :mobile_phone, :comments)
    end
end
