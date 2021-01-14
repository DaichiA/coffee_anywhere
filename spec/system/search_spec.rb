require 'rails_helper'

RSpec.describe 'search', type: :system do
  let!(:shop) { FactoryBot.create(:shop, :with_tags) } # 東京
  let!(:second_shop) { FactoryBot.create(:second_shop, :with_tags) } # 東京, second_tag
  let!(:third_shop) { FactoryBot.create(:third_shop, :with_tags) } # second_tag
  let!(:fourth_shop) { FactoryBot.create(:fourth_shop) }
  let!(:fifth_shop) { FactoryBot.create(:fifth_shop) }

  subject { page }

  it 'searchs but no shops found' do
    visit root_path
    fill_in 'キーワードでお店を検索', with: '存在しないお店'
    find('.btn-warning').click
    expect(current_path).to eq shops_path
    is_expected.to have_content 'キーワードに合致するお店はありませんでした。'
  end

  it 'searchs with name column' do
    visit root_path
    fill_in 'キーワードでお店を検索', with: shop.name
    find('.btn-warning').click
    expect(current_path).to eq shops_path
    is_expected.to have_link shop.name
    is_expected.to have_link shop.description
    is_expected.to have_selector("img[src$='shop_image.jpg']")
    is_expected.to have_content shop.dayoff
    is_expected.to_not have_content second_shop.name
    is_expected.to_not have_content third_shop.name
    is_expected.to_not have_content fourth_shop.name
    is_expected.to_not have_content fifth_shop.name
  end

  it 'searchs with address column' do
    visit root_path
    fill_in '地域でお店を検索', with: '東京'
    find('.btn-warning').click
    expect(current_path).to eq shops_path
    is_expected.to have_link shop.name
    is_expected.to have_link shop.description
    is_expected.to have_selector("img[src$='shop_image.jpg']")
    is_expected.to have_content shop.dayoff
    is_expected.to have_link second_shop.name
    is_expected.to have_link second_shop.description
    is_expected.to have_selector("img[src$='second_shop_image.jpg']")
    is_expected.to have_content second_shop.dayoff
    is_expected.to_not have_content third_shop.name
    is_expected.to_not have_content fourth_shop.name
    is_expected.to_not have_content fifth_shop.name
  end

  it 'searchs with phone number column' do
    visit root_path
    fill_in 'キーワードでお店を検索', with: third_shop.phone_number
    find('.btn-warning').click
    expect(current_path).to eq shops_path
    is_expected.to have_link third_shop.name
    is_expected.to have_link third_shop.description
    is_expected.to have_selector("img[src$='third_shop_image.jpg']")
    is_expected.to have_content third_shop.dayoff
    is_expected.to_not have_content shop.name
    is_expected.to_not have_content second_shop.name
    is_expected.to_not have_content fourth_shop.name
    is_expected.to_not have_content fifth_shop.name
  end

  it 'searchs with description column' do
    visit root_path
    fill_in 'キーワードでお店を検索', with: '4軒目'
    find('.btn-warning').click
    expect(current_path).to eq shops_path
    is_expected.to have_link fourth_shop.name
    is_expected.to have_link fourth_shop.description
    is_expected.to have_selector("img[src$='fourth_shop_image.jpg']")
    is_expected.to have_content fourth_shop.dayoff
    is_expected.to_not have_content shop.name
    is_expected.to_not have_content second_shop.name
    is_expected.to_not have_content third_shop.name
    is_expected.to_not have_content fifth_shop.name
  end

  it 'searchs with tag name' do
    visit root_path
    fill_in 'キーワードでお店を検索', with: 'second_tag'
    find('.btn-warning').click
    expect(current_path).to eq shops_path
    is_expected.to have_link second_shop.name
    is_expected.to have_link second_shop.description
    is_expected.to have_selector("img[src$='second_shop_image.jpg']")
    is_expected.to have_content second_shop.dayoff
    is_expected.to have_link third_shop.name
    is_expected.to have_link third_shop.description
    is_expected.to have_selector("img[src$='third_shop_image.jpg']")
    is_expected.to_not have_content shop.name
    is_expected.to_not have_content fourth_shop.name
    is_expected.to_not have_content fifth_shop.name
  end
end
