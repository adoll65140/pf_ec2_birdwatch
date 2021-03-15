require 'rails_helper'

RSpec.describe "Breeds", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/breeds/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/breeds/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
