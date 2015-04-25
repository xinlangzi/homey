class RequestsController < ApplicationController
  # GET /requests/new
  def new
    @request = Request.new
  end

  # POST /requests
  def create
    @request = Request.new(request_params)

    respond_to do |format|
      if @request.save
        format.html {  }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:kind, :intention, :category, :bathroom_count, :bedroom_count, :budget, :start_of_lease, :end_of_lease, :name, :email, :mobile_phone, :comments)
    end
end
