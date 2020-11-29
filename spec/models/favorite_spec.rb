require 'rails_helper'

RSpec.describe Favorite, type: :model do

  it "comes most recent favorite first" do
    user = FactoryBot.create(:user)
    favorite1 = FactoryBot.create(:favorite, user_id: user.id)
    favorite2 = FactoryBot.create(:new_favorite, user_id: user.id)
    favorite3 = FactoryBot.create(:old_favorite, user_id: user.id)
    expect(favorite2).to eq user.favorites.first
  end
end
