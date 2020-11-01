require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "new" do
    it "returns http success" do
      get login_path
      expect(response).to have_http_status(:success)
    end
  end

  # describe "create" do
  #   it "login with valid information" do
  #     user = FactoryBot.build(:user)
  #     get login_path
  #     post login_path, params: { 
  #       email: user.email,
  #       password: user.password
  #     }
  #     expect(response).to have_http_status(:success)
  #     expect(flash).to_not be_empty
  #   end

    # it "login with invalid information" do
    #   user = FactoryBot.build(:user_invalid)
    #   get login_path
    #   post login_path, params: { 
    #     email: user.email,
    #     password: user.password
    #   }
    #   expect(response).to render_template(:new)
    #   expect(flash).to_not be_empty
    # end
  # end

  

  # describe "GET /destroy" do
  #   it "returns http success" do
  #     #ログインさせる
  #     post logout_path
  #     expect().to 
  #   end
  # end

end
