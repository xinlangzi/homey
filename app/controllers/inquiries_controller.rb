class InquiriesController < ApplicationController
  # GET /inquiries/new
  def new
    @inquiry = Inquiry.new(property_id: params[:property_id])
    authorize @inquiry
    captcha = Captcha.random_qa
    @inquiry.captcha_question = captcha[:question]
    session[:captcha_response] = captcha[:answer]
  end
  
  # POST /inquiries
  # POST /inquiries.json
  def create
    @inquiry = Inquiry.new(inquiry_params)
    authorize @inquiry

    respond_to do |format|
      if verify_captcha(@inquiry)
        if @inquiry.save
          flash.now[:notice] = "Thank you for your message. We will contact you soon!"
          format.html { render }
        else
          format.html { redirect_to(new_inquiry_path(property_id: @inquiry.property_id), flash: { error: "Cannot send message. Please try again."}) }
        end
      else
        format.html { redirect_to(new_inquiry_path(property_id: @inquiry.property_id), flash: { error: "Are you sure that you are a human?"}) }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def inquiry_params
      params.require(:inquiry).permit(:name, :email, :mobile_phone, :comment, :property_id, :captcha_response)
    end
    
    def verify_captcha(inquiry)
      return session[:captcha_response] == Captcha.encode(inquiry.captcha_response) rescue false
    end
end
