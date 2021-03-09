require 'rails_helper'

RSpec.describe "Birds", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/birds/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/birds/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/birds/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/birds/new"
      expect(response).to have_http_status(:success)
    end
  end

end
