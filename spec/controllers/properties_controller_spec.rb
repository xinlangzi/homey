require 'rails_helper'

RSpec.describe PropertiesController, type: :controller do
  let(:property){ create(:property) }

  describe "GET #show" do
    it "returns http success" do
      get :show, id: property.id
      expect(response).to have_http_status(:success)
    end
  end

end
