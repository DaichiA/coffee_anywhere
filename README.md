# COFFEE ANYWHERE

# 概要
地域や淹れ方でコーヒー屋さんを探せるサービスです。
未だ見ぬコーヒー屋を探す際、エスプレッソが飲みたいのに行ってみるとドリップコーヒーしか置いていない店だったり、美味しいコーヒーが飲みたいのにスイーツがメインでコーヒーはおまけ程度という店だったりということも少なくありません。
コーヒー好きのために、自分の好みに合った店を探せるようにこのサービスを作りました。
キーワードでの検索窓や、ホーム画面のリンクから、希望の条件でコーヒー店を探すことができます。
またログインすると店をブックマークしたり、行った店へのレビューを投稿したり、またそれらをマイページで一覧ですることができます。

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
https://user-images.githubusercontent.com/70304933/100599532-801ad680-3343-11eb-944b-375959200d87.png

## ログインページ
https://user-images.githubusercontent.com/70304933/100599890-ee5f9900-3343-11eb-99a9-cff9c5ffc3e5.png

## マイページ(レビュー)
https://user-images.githubusercontent.com/70304933/100600242-61690f80-3344-11eb-9584-2cbeddd2d504.png

## マイページ（ブックマーク）
https://user-images.githubusercontent.com/70304933/100600162-3ed6f680-3344-11eb-975e-a2af1d8ea3ac.png

## 検索結果
https://user-images.githubusercontent.com/70304933/100599929-fe777880-3343-11eb-9c12-147f83338036.png