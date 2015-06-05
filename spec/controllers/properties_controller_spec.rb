require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:property){ create(:property) }

  describe "GET #show" do
    it "returns http success" do
      get :show, id: property.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    let(:area) { create(:area) }
    
    it "no area name" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:area_desc)).to be_nil
    end

    it "have area name" do
      get :index, q: { area_id_eq: area.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:area_desc)).to eq("Starbucks")
    end
  end
end
