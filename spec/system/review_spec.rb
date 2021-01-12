require 'rails_helper'

RSpec.describe 'review', type: :system, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:other_user) }
  let!(:shop) { FactoryBot.create(:shop) }
  let!(:second_shop) { FactoryBot.create(:second_shop) }

  subject { page }

  # ログインしないとレビューが書けない
  context 'as a guest user' do
    it 'can not post review' do
      visit root_path
      fill_in 'キーワードでお店を検索', with: shop.name
      find('.btn-warning').click
      click_link shop.name
      is_expected.to have_content 'レビューはまだありません。'
      is_expected.to have_content 'お店のレビュー(0件)'
      is_expected.to_not have_link '投稿する'
    end
  end

  context 'as a login user' do
    before do
      login(user)
    end

    context 'no reviews exist' do
      it 'post a new review' do
        visit root_path
        find('.dropdown-toggle').click
        click_on 'マイページ'
        click_link 'レビュー'
        is_expected.to have_content 'まだレビューを投稿していません'
        visit root_path
        fill_in 'キーワードでお店を検索', with: shop.name
        find('.btn-warning').click
        click_link shop.name
        is_expected.to have_content 'レビューはまだありません。'
        is_expected.to have_content 'お店のレビュー(0件)'
        click_button '投稿する'
        fill_in 'タイトル', with: 'test review'
        find('#star').find("img[alt='4']").click # rate
        fill_in '本文', with: 'review sentence'
        expect {
          click_button '投稿'
        }.to change(Review, :count).by(1)
        expect(current_path).to eq shop_path(shop)
        is_expected.to_not have_content 'レビューはまだありません。'
        is_expected.to have_content 'お店のレビュー(1件)'
        within '.my_review' do
          is_expected.to have_content "#{user.name}さんのレビュー"
          is_expected.to have_content Review.first.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content 'test review'
          is_expected.to have_selector("img[src*='star-on']")
          is_expected.to have_content 'review sentence'
          is_expected.to have_link '[削除]'
        end
        # マイページで自分のレビューが見れる
        find('.dropdown-toggle').click
        click_link 'マイページ'
        click_link 'レビュー'
        is_expected.to have_content "#{user.name}さんのレビュー"
        is_expected.to have_content Review.first.created_at.strftime('%Y年%m月%d日')
        is_expected.to have_content 'test review'
        is_expected.to have_content 'review sentence'
        is_expected.to have_link '[削除]'
      end
    end

    context 'some reviews exist' do
      let!(:review) { FactoryBot.create(:review, shop: shop, user: user) }
      let!(:other_review) { FactoryBot.create(:old_review, shop: shop, user: other_user) }
      let!(:second_shop_review) { FactoryBot.create(:new_review, shop: second_shop, user: user) }

      # レビューが3件以上あると<レビューをもっと見る>リンクが出る
      it 'post a third review' do
        visit root_path
        fill_in 'キーワードでお店を検索', with: shop.name
        find('.btn-warning').click
        click_link shop.name
        # レビューが2件存在し、新しいものが上にある
        is_expected.to have_content 'お店のレビュー(2件)'
        is_expected.to_not have_link '<レビューをもっと見る>'
        within all('.my_review')[0] do
          is_expected.to have_content "#{user.name}さんのレビュー"
          is_expected.to have_content review.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content review.title
          is_expected.to have_content review.content
          is_expected.to have_link '[削除]'
        end
        within all('.my_review')[1] do
          is_expected.to have_content "#{other_user.name}さんのレビュー"
          is_expected.to have_content other_review.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content other_review.title
          is_expected.to have_content other_review.content
          is_expected.to_not have_link '[削除]'
        end
        click_button '投稿する'
        fill_in 'タイトル', with: 'the third review'
        find('#star').find("img[alt='4']").click # rate
        fill_in '本文', with: 'the third review sentence'
        expect {
          click_button '投稿'
        }.to change(Review, :count).by(1)

        # レビューが3件になり、新しい2件のみが表示されている
        is_expected.to have_content 'お店のレビュー(3件)'
        within all('.my_review')[0] do
          is_expected.to have_content "#{user.name}さんのレビュー"
          is_expected.to have_content Review.first.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content 'the third review'
          is_expected.to have_content 'the third review sentence'
          is_expected.to have_link '[削除]'
        end
        within all('.my_review')[1] do
          is_expected.to have_content "#{user.name}さんのレビュー"
          is_expected.to have_content review.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content review.title
          is_expected.to have_content review.content
          is_expected.to have_link '[削除]'
        end
        is_expected.to have_link '<レビューをもっと見る>'

        # リンク先で全てのレビューが見れる
        click_link '<レビューをもっと見る>'
        is_expected.to have_selector('.my_review', count: 3)
        is_expected.to have_content Review.first.title
        is_expected.to have_content review.title
        is_expected.to have_content other_review.title

        # マイページで自分のレビューが反映されてる
        find('.dropdown-toggle').click
        click_link 'マイページ'
        click_link 'レビュー'
        within all('.my_review')[0] do
          is_expected.to have_content "#{user.name}さんのレビュー"
          is_expected.to have_content Review.first.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content 'the third review'
          is_expected.to have_content 'the third review sentence'
          is_expected.to have_link '[削除]'
        end
        within all('.my_review')[1] do
          is_expected.to have_content "#{user.name}さんのレビュー"
          is_expected.to have_content review.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content review.title
          is_expected.to have_content review.content
          is_expected.to have_link '[削除]'
        end
        within all('.my_review')[2] do
          is_expected.to have_content "#{user.name}さんのレビュー"
          is_expected.to have_content second_shop_review.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content second_shop_review.title
          is_expected.to have_content second_shop_review.content
          is_expected.to have_link '[削除]'
        end
      end

      # 他の人のレビューには[削除]がない
      it 'destroy a review', js: true do
        visit root_path
        fill_in 'キーワードでお店を検索', with: shop.name
        find('.btn-warning').click
        click_link shop.name
        within all('.my_review')[0] do
          is_expected.to have_content "#{user.name}さんのレビュー"
          is_expected.to have_content review.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content review.title
          is_expected.to have_content review.content
          is_expected.to have_link '[削除]'
        end
        within all('.my_review')[1] do
          is_expected.to have_content "#{other_user.name}さんのレビュー"
          is_expected.to have_content other_review.created_at.strftime('%Y年%m月%d日')
          is_expected.to have_content other_review.title
          is_expected.to have_content other_review.content
          is_expected.to_not have_link '[削除]'
        end
        click_link '[削除]'
        expect {
          expect(page.accept_confirm).to eq '本当に削除しますか？'
          is_expected.to have_selector('.alert-success', text: 'レビューを削除しました。')
        }.to change(user.reviews, :count).by(-1)
        expect(current_path).to eq shop_path(shop)
        within '.my_review' do
          is_expected.to_not have_content review.created_at.strftime('%Y年%m月%d日')
          is_expected.to_not have_content review.title
          is_expected.to_not have_content review.content
        end
      end
    end
  end
end
