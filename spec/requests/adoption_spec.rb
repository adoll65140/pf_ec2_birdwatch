require 'rails_helper'

RSpec.describe "Adoptions", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/adoption/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/adoption/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/adoption/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/adoption/new"
      expect(response).to have_http_status(:success)
    end
  end

end
