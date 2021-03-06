require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Backend::InquiriesController, type: :controller do
  before do
    sign_in admin
  end

  let(:admin) { create(:user, :admin) }

  # This should return the minimal set of attributes required to create a valid
  # Inquiry. As you add validations to Inquiry, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "Joe", email: "Joe@example.com", comment: "wow" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # InquiriesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all inquiries as @inquiries" do
      inquiry = Inquiry.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:inquiries)).to eq([inquiry])
    end
  end

  describe "GET #show" do
    it "assigns the requested inquiry as @inquiry" do
      inquiry = Inquiry.create! valid_attributes
      get :show, {:id => inquiry.to_param}, valid_session
      expect(assigns(:inquiry)).to eq(inquiry)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested inquiry" do
      inquiry = Inquiry.create! valid_attributes
      expect {
        delete :destroy, {:id => inquiry.to_param}, valid_session
      }.to change(Inquiry, :count).by(-1)
    end

    it "redirects to the inquiries list" do
      inquiry = Inquiry.create! valid_attributes
      delete :destroy, {:id => inquiry.to_param}, valid_session
      expect(response).to redirect_to(backend_inquiries_url)
    end
  end
end
