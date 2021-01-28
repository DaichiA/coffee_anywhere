# COFFEE ANYWHERE

# 概要
淹れ方や様々な条件でコーヒー屋さんを探せるサービスです。  
コーヒー好きのために、自分の好みに合った店を探せるようにこのサービスを作りました。  
・検索窓からキーワードや店名で検索  
・淹れ方やそのお店の特徴をタグの一覧から検索  
・SNSアカウント（Facebook・Twitter）での会員登録  
・行ったお店や気になるお店をブックマークしマイページで管理  
・お店を点数評価付きでレビューの投稿
  
   
# URL
https://coffee-anywhere.com/  
  
ホーム画面とログイン画面にワンクリックでログインできる機能がありますのでそちらをぜひご利用ください。  
  
フォームからログインするにはこちらをお使いください。  
  
テストユーザーアカウント  
メール：testuser@example.com  
パスワード：goodcoffee

# 各種機能、導入技術
・プラットフォーム（AWS EC2）
・データベース（AWS RDS, MySQL）  
・テスト（RSpec, Capybara, factory_bot）  
・自動テスト（circleCI）  
・自動デプロイ（Capistrano）  
・コンテナ仮想化（Docker）  
・CSSフレームワーク（Bootstrap4）  
・コードチェック（rubocop）  
・ユーザー登録、ログイン（Sorcery）  
・SNSログイン（Facebook, Twitter）  
・画像アップロード（Active Storage, mini_magic, AWS S3）  
・ブックマーク（Ajax)  
・ページネーション（will_paginate）  
・検索（ransack）  
・メールアクティベーション、パスワードリセット （ActionMailer）  
・タグ付機能（Tag-it）  
・マップ（geocoder）
・レビュー（jquery）   
・レビューの星評価（jquery.raty）  
・管理者機能  


使用したAWSのサービス  
・VPC  
・RDS  
・EC2  
・Route 53  
・ACM  
・ALB  
・S3  
・IAM  

# ER図
<img width="1209" alt="ER図" src="https://user-images.githubusercontent.com/70304933/103478814-9d443880-4e0c-11eb-9261-0a050d67f88a.png">


# スクリーンショット
  
## トップページ
![coffee-anywhere com_ (4)](https://user-images.githubusercontent.com/70304933/103609746-e063f000-4f61-11eb-98bb-e3d82e5b7a79.png)
  

## ログインページ
![coffee-anywhere com_ (3)](https://user-images.githubusercontent.com/70304933/103495185-3e6ad780-4e7d-11eb-8ef8-83dc378ab098.png)
  

## マイページ(レビュー)
![coffee-anywhere com_shops_q%5Bname_or_address_or_phone_number_or_description_or_tags_tag_name_cont%5D= button= (2)](https://user-images.githubusercontent.com/70304933/103505845-9bc35080-4e9e-11eb-82a9-07f4a608e337.png)
    

## マイページ（ブックマーク）
![coffee-anywhere com_shops_q%5Bname_or_address_or_phone_number_or_description_or_tags_tag_name_cont%5D= button= (1)](https://user-images.githubusercontent.com/70304933/103505826-8cdc9e00-4e9e-11eb-843f-1c091d90731a.png)
  

## 検索結果
![coffee-anywhere com_shops_q%5Bname_or_address_or_phone_number_or_description_or_tags_tag_name_cont%5D= button=](https://user-images.githubusercontent.com/70304933/103505793-76cedd80-4e9e-11eb-9af9-477a376ce063.png)
  
  
  
