require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET /create" do
  #   it "returns http success" do
  #     get login_path
  #     #ログインさせる
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     #ログインさせる
  #     post logout_path
  #     expect().to 
  #   end
  # end

end
