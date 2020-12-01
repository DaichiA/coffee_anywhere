# COFFEE ANYWHERE

# 概要
地域や淹れ方でコーヒー屋さんを探せるサービスです。  
未だ見ぬコーヒー屋を探す際、エスプレッソが飲みたいのに行ってみるとドリップコーヒーしか置いていない店だったり、美味しいコーヒーが飲みたいのにスイーツがメインでコーヒーはおまけ程度という店だったりということも少なくありません。  
コーヒー好きのために、自分の好みに合った店を探せるようにこのサービスを作りました。  
キーワードでの検索窓や、ホーム画面のリンクから、希望の条件でコーヒー店を探すことができます。
またログインすると店をブックマークしたり、行った店へのレビューを投稿したり、またそれらをマイページで一覧することができます。  
  
# 作る上で意識したこと
できるだけシンプルに、説明しなくとも見ただけでどのようなサービスかがわかるように作成しました。搭載した機能は今後自分の手で改良していけるようにという点を念頭に置いての制作を心がけました。逆にいうとまだまだ改良の余地はありますが、ユーザーが不自由なく使うのに必要な機能は盛り込んだつもりです。  
  
また開発の際はGithubの機能をできるだけ活用し、  
issueを確認、branchを切る、開発、push, pull request, merge  
というチームでの開発の流れを辿ることを意識しました。  
  
# 開発環境
・Ruby 2.7.1  
・Rails 6.0.3.4  
  
# 各種機能、導入技術
・プラットフォーム（heroku）  
・データベース（MySQL）  
・テスト（RSpec, Capybara, factory_bot）  
・CSSフレームワーク（Bootstrap4）  
・ユーザー登録、ログイン（Sorcery）  
・画像アップロード（Active Storage, mini_magic, AWS S3） 
・ブックマーク（Ajax)  
・ページネーション（will_paginate）  
・検索（ransack）  
・メールアクティベーション、パスワードリセット （ActionMailer, gmail）  
・管理者機能  
・レビュー  
・ブックマーク  
  
# URL
https://coffee-anywhere.herokuapp.com/  
  
ホーム画面とログイン画面にワンクリックでログインできる機能がありますのでそちらをぜひご利用ください。  
  
フォームからログインするにはこちらをお使いください。  
  
テストユーザーアカウント  
メール：testuser@example.com  
パスワード：goodcoffee  
  
# スクリーンショット
  
## トップページ
![coffee-anywhere herokuapp com_](https://user-images.githubusercontent.com/70304933/100679625-3cf84c00-33b3-11eb-95c7-0e9d53dd1f90.png)
  

## ログインページ
![coffee-anywhere herokuapp com_ (1)](https://user-images.githubusercontent.com/70304933/100679657-4bdefe80-33b3-11eb-848f-3075165caee0.png)
  

## マイページ(レビュー)
![coffee-anywhere herokuapp com_ (4)](https://user-images.githubusercontent.com/70304933/100679689-6022fb80-33b3-11eb-84d3-a4da4e6c8b2e.png)
  

## マイページ（ブックマーク）
![coffee-anywhere herokuapp com_ (3)](https://user-images.githubusercontent.com/70304933/100679710-6b762700-33b3-11eb-981c-8ca27e6429e7.png)
  

## 検索結果
![coffee-anywhere herokuapp com_shops_q%5Bname_or_address_or_phone_number_or_description_or_tags_tag_name_cont%5D= button=](https://user-images.githubusercontent.com/70304933/100679729-7466f880-33b3-11eb-8bbf-0c6469e995ec.png)
  