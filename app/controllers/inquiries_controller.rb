class InquiriesController < ApplicationController
  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new(property_id: params[:property_id])
    authorize @inquiry
  end

  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)
    authorize @inquiry

    respond_to do |format|
      if verify_recaptcha
        if @inquiry.save
          flash.now[:notice] = "Thank you for your message. We will contact you soon!"
          format.html { render }
        else
          flash.now[:error] = "Cannot send message. Verify the following errors."
          format.html { render :new }
        end
      else
        flash.now[:error] = "Oh! It's error with reCAPTCHA!"
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :mobile_phone, :comment, :property_id)
    end
end
