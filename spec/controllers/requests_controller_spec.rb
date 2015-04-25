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

RSpec.describe RequestsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Request. As you add validations to Request, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "Philip", email: "philip@example.com", mobile_phone: "888", kind: :expat }
  }

  let(:invalid_attributes) {
    { name: "Philip" }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RequestsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  # describe "GET #index" do
  #   it "assigns all requests as @requests" do
  #     request = Request.create! valid_attributes
  #     get :index, {}, valid_session
  #     expect(assigns(:requests)).to eq([request])
  #   end
  # end
  #
  # describe "GET #show" do
  #   it "assigns the requested request as @request" do
  #     request = Request.create! valid_attributes
  #     get :show, {:id => request.to_param}, valid_session
  #     expect(assigns(:request)).to eq(request)
  #   end
  # end
  #
  describe "GET #new" do
    it "assigns a new request as @request" do
      get :new, {}, valid_session
      expect(assigns(:request)).to be_a_new(Request)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Request" do
        expect {
          post :create, {:request => valid_attributes}, valid_session
        }.to change(Request, :count).by(1)
      end

      it "assigns a newly created request as @request" do
        post :create, {:request => valid_attributes}, valid_session
        expect(assigns(:request)).to be_a(Request)
        expect(assigns(:request)).to be_persisted
      end

      it "redirects to the created request" do
        post :create, {:request => valid_attributes}, valid_session
        expect(response).to render_template("create")
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved request as @request" do
        post :create, {:request => invalid_attributes}, valid_session
        expect(assigns(:request)).to be_a_new(Request)
      end

      it "re-renders the 'new' template" do
        post :create, {:request => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested request" do
  #     request = Request.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => request.to_param}, valid_session
  #     }.to change(Request, :count).by(-1)
  #   end
  #
  #   it "redirects to the requests list" do
  #     request = Request.create! valid_attributes
  #     delete :destroy, {:id => request.to_param}, valid_session
  #     expect(response).to redirect_to(requests_url)
  #   end
  # end

end
