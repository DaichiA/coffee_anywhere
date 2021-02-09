# COFFEE ANYWHERE

# 概要 
<img width="1170" alt="スクリーンショット 2021-02-09 午後4 42 44" src="https://user-images.githubusercontent.com/70304933/107332993-334c3c80-6af8-11eb-8557-f36a06d2e45a.png">
  
  

淹れ方や様々な条件でコーヒー屋さんを探せるサービスです。  
コーヒー好きのために、自分の好みに合った店を探せるようにこのサービスを作りました。 
  


# URL
https://coffee-anywhere.com/  
  
ホーム画面とログイン画面にワンクリックでログインできる機能がありますのでそちらをぜひご利用ください。  
  
フォームからログインするにはこちらをお使いください。  
  
テストユーザーアカウント  
メール：testuser@example.com  
パスワード：goodcoffee
  


# 使用技術
・フロントエンド（HTML/CSS, Sass, Javascript, bootstrap, jQuery）  
・バックエンド（ruby 2.7.1, Rails 6.0.3.4, Nginx, Puma）  
・データベース（mysql 8.0.22）  
・AWS（VPC, RDS, EC2, Route 53, ACM, ALB, S3, IAM)  
・テスト（Rspec, FactoryBot, Capybara）  
・コードチェック（rubocop）  
・CI/CD（CircleCI, Capistrano）  
・開発環境（Git, GitHub, VScode, Docker, Docker-compose）  
  


# 主要機能一覧
| 機能名 | 説明 |
| ------------- | ------------- |
| 検索 | 地域やキーワードでお店の検索が可能。検索窓の他に、Topから淹れ方や様々な条件でも検索可能  |
| レビュー投稿 | お店に対して、星マークで点数の評価と共にレビューの投稿  |
| ログイン | eメール、Twitter、Facebookで会員登録、ログイン |
| コメント投稿 | お店に投稿されているレビューに対しコメントの投稿 |
| 通知 | 自分の投稿したレビューにコメントがついた時と、自分がコメントを投稿したレビューに他の人からコメントがついた時にユーザーアイコンにバッジで通知。ユーザーページから通知一覧の表示。 |
| ブックマーク | お店をブックマークでき、ユーザーページでマップ上に表示 |
| マップ表示 | 店舗詳細ページにそのお店の場所を、ユーザーページに自分がブックマークしたお店全てをGoogleMapに表示 |
| SNS共有 | 店舗詳細ページからTwitter、Facebook、LINEで情報共有ができる |
| 管理者機能 | ユーザーの一覧表示、ユーザーアクティベーション状況の把握、店舗情報の登録・修正、各データの削除 |
| タグ付け | 店舗情報登録（管理者機能）の際、タグ付により情報を付加、入力の際は既存タグのサジェスト機能 |
  
  
  
# ER図
![CoffeeMap_ER (2)](https://user-images.githubusercontent.com/70304933/107328952-d39f6280-6af2-11eb-9706-71224051ea95.png)



