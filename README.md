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
  
開発の際はGithubの機能をできるだけ活用し、  
issueを確認、branchを切る、開発、push, pull request, merge  
というチームでの開発の流れを辿ることを意識しました。  
  

# ER図
<img width="1209" alt="ER図" src="https://user-images.githubusercontent.com/70304933/103478814-9d443880-4e0c-11eb-9261-0a050d67f88a.png">


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
  
  