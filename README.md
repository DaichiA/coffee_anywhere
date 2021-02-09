# COFFEE ANYWHERE

# 概要
淹れ方や様々な条件でコーヒー屋さんを探せるサービスです。  
コーヒー好きのために、自分の好みに合った店を探せるようにこのサービスを作りました。  
・検索窓からキーワードや店名で検索  
・淹れ方やそのお店の特徴をタグの一覧から検索  
<img width="792" alt="スクリーンショット 2021-02-08 午後7 28 41" src="https://user-images.githubusercontent.com/70304933/107207662-ea3ab080-6a43-11eb-9e7d-4db1890aeac3.png">
  
  
・SNSアカウント（Facebook・Twitter）での会員登録  
<img width="974" alt="スクリーンショット 2021-02-08 午後7 29 59" src="https://user-images.githubusercontent.com/70304933/107207777-0fc7ba00-6a44-11eb-816d-a61633513a38.png">
  
  
・行ったお店や気になるお店をブックマークしマイページで管理  
・ブックマークしたお店はマイページで地図上で一覧に 
<img width="1435" alt="スクリーンショット 2021-02-08 午後7 20 56" src="https://user-images.githubusercontent.com/70304933/107208016-587f7300-6a44-11eb-9de9-5ebeabf5f80b.png">
  
  
・お店を点数評価付きでレビューの投稿  
・投稿されているレビューに対しコメントの投稿  
<img width="545" alt="スクリーンショット 2021-02-08 午後7 22 19" src="https://user-images.githubusercontent.com/70304933/107208147-88c71180-6a44-11eb-881e-15d13ccb325f.png">
   
・自分に関する投稿の通知をアイコンへのバッジで表示  
<img width="548" alt="スクリーンショット 2021-02-09 午後4 25 45" src="https://user-images.githubusercontent.com/70304933/107329451-88398400-6af3-11eb-925d-5707f3bad43e.png">
  
   
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
・通知機能  
・投稿されたレビューへ対するコメント機能  


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
![CoffeeMap_ER (2)](https://user-images.githubusercontent.com/70304933/107328952-d39f6280-6af2-11eb-9706-71224051ea95.png)



