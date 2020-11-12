require 'rails_helper'

RSpec.describe "Shop", type: :system do
  let(:user) { FactoryBot.create(:admin_user) }

  before do
    login(user) #モジュールに切り分けた
  end

  # UIができてから書く

  # describe "new to create" do

  # end

  # describe "edit to update" do
  # end

end