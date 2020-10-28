require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
    
    it "adds a user" do
      get signup_path
      expect{
        post users_path, params: {
          user: FactoryBot.attributes_for(:user)
        }
      }.to change(User, :count).by(1)
      expect(response).to redirect_to root_path
      expect(response).to have_http_status "302"
    end

    it "can not add a invalid user" do
      get signup_path
      expect{
        post users_path, params: {
          user: FactoryBot.attributes_for(:user_invalid)
        }
      }.to_not change(User, :count)
    end
  end


      
  # describe "GET /show" do
  #   it "returns http success" do
  #     user = FactoryBot.build(:user)
  #     get user_path(user)
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
