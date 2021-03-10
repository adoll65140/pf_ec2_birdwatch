require 'rails_helper'

RSpec.describe "LostBirds", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/lost_birds/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/lost_birds/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/lost_birds/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/lost_birds/show"
      expect(response).to have_http_status(:success)
    end
  end

end
