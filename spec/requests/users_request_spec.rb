require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "new" do
    it "returns http success" do
      get signup_path
      expect(response).to have_http_status(:success)
    end
  end
    
  #web経由でadminを編集できないことと、updateできないことのテスト書く
  

end
