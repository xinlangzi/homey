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

RSpec.describe Backend::OrdersController, type: :controller do
  before do
    sign_in admin
  end

  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user) }
  let(:property) { create(:property) }

  # This should return the minimal set of attributes required to create a valid
  # Order. As you add validations to Order, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "wow", property_id_string: property.property_id }
  }

  let(:invalid_attributes) {
    { dog: "s"}
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # OrdersController. Be sure to keep this updated too.
  let(:valid_session) { { } }

  describe "GET #new" do
    it "assigns a new order as @order" do
      get :new, { user_id: user.id }, valid_session
      expect(assigns(:order)).to be_a_new(Order)
    end
  end

  describe "GET #edit" do
    it "assigns the requested order as @order" do
      order = Order.create! valid_attributes
      get :edit, {user_id: user.id, :id => order.to_param}, valid_session
      expect(assigns(:order)).to eq(order)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Order" do
        expect {
          post :create, {user_id: user.id, :order => valid_attributes}, valid_session
        }.to change(Order, :count).by(1)
        expect(assigns(:order)).to be_a(Order)
        expect(assigns(:order)).to be_persisted
        expect(response).to redirect_to([:backend, user])
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved order as @order" do
        post :create, {user_id: user.id, :order => invalid_attributes}, valid_session
        expect(assigns(:order)).to be_a_new(Order)
      end

      it "re-renders the 'new' template" do
        post :create, {user_id: user.id, :order => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: "dot", property_id_string: property.property_id }
      }

      it "updates the requested order" do
        order = Order.create! valid_attributes
        put :update, {user_id: user.id, :id => order.to_param, :order => new_attributes}, valid_session
        order.reload
        expect(order.name).to eq("dot")
        expect(assigns(:order)).to eq(order)
        expect(response).to redirect_to([:backend, user])
      end
    end

    context "with invalid params" do
      it "assigns the order as @order" do
        order = Order.create! valid_attributes
        put :update, {user_id: user.id, :id => order.to_param, :order => invalid_attributes}, valid_session
        expect(assigns(:order)).to eq(order)
      end

      it "re-renders the 'edit' template" do
        order = Order.create! valid_attributes
        put :update, {user_id: user.id, :id => order.to_param, :order => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested order" do
      order = Order.create! valid_attributes
      expect {
        delete :destroy, {user_id: user.id, :id => order.to_param}, valid_session
        expect(response).to redirect_to([:backend, user])
      }.to change(Order, :count).by(-1)
    end
  end

end
