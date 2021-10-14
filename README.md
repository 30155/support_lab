# アプリ名

Support Lab

# 概要

本アプリは、学習内容と実験内容の記録や、チャット、スケジュール管理をすることができます。

# 本番環境

https://support-lab.herokuapp.com/

ログイン情報（テスト用）
・Eメール：test@gmail.com
・パスワード：test1234

# 制作背景（意図）

本アプリのターゲットユーザーは学生、特に理系大学生を視野に考えて作成しました。
私は学生時代、日々の学習の中で多くの学びがある中、学んだ内容をうまく管理できず復習に苦労した経験があります。
とくに、卒業論文の作成にあたっては、用語や知識がどの論文のどこに書いてあったか忘れて探すのに手間取りました。
また、実験記録をホワイトボードや紙媒体に記録することが多く、それらの管理も疎かになることがありました。
そこで、知識や実験記録をデジタル媒体に記録して一括管理し、さらに検索機能によって探す手間を省けるものがあると良いと考え本アプリを作成しました。
さらに、多忙な学生のスケジュール管理用にカレンダー機能を、研究室メンバーとの意見交流の場としてチャット機能を追加しました。

# DEMO

### ノート機能
最初の画面
[![Image from Gyazo](https://i.gyazo.com/0c92340ee1eebfc0b0d0d1458e9f68f7.png)](https://gyazo.com/0c92340ee1eebfc0b0d0d1458e9f68f7)

ノート登録
[![Image from Gyazo](https://i.gyazo.com/4f81f46d41efa839cb6f35593148ec06.gif)](https://gyazo.com/4f81f46d41efa839cb6f35593148ec06)

検索機能
[![Image from Gyazo](https://i.gyazo.com/8d6df1be6ad947346f4b83e317955719.gif)](https://gyazo.com/8d6df1be6ad947346f4b83e317955719)

### チャット機能
ルーム作成
[![Image from Gyazo](https://i.gyazo.com/9e322406b62980067da16f5daa02b5ff.gif)](https://gyazo.com/9e322406b62980067da16f5daa02b5ff)

投稿機能
[![Image from Gyazo](https://i.gyazo.com/2979e2444ef1605c46704ee17d969b48.gif)](https://gyazo.com/2979e2444ef1605c46704ee17d969b48)

### 実験記録登録機能
実験記録登録
[![Image from Gyazo](https://i.gyazo.com/2a3546e5c0c801673f5106b491cd200f.gif)](https://gyazo.com/2a3546e5c0c801673f5106b491cd200f)

### スケジュール管理機能
スケジュール登録
[![Image from Gyazo](https://i.gyazo.com/a7540763d0fd1b86b76e0212ad1008a6.gif)](https://gyazo.com/a7540763d0fd1b86b76e0212ad1008a6)

# 工夫した点

本アプリのメイン機能は記録することです。記録するのは後々のその人にとっては良いことですが、実際に記録をするのは面倒なことです。
そこで、なるべくストレスを減らすべく、ページ遷移の回数を減らすように心がけました。なので、作成画面と一覧画面や、詳細画面と編集画面を同じ一つのビューで兼任させています。
デザインは、統一した字体を採用して一貫性を、青寄りの色を中心にして集中の妨げにならないことを念頭に入れました。

# 使用技術（開発環境）

## バックエンド

Ruby, Ruby on Rails

## フロントエンド

HTML, CSS, JavaScript

## データベース

MySQL, SequelPro

## Webサーバ（本番環境）

Heroku

## ソース管理

GitHub, GitHubDesktop

## テスト

RSpec

## エディタ

VSCode

# 課題や今後の実装したい機能

アプリ全体としては、より感覚的で滑らかな操作、使用感を実現すべくJavaScriptの学習も深めたいです。
セキュリティに関して、SQLインジェクションやXSSの対策を行ってみたいと考えています。
未実装の機能の一つであるIdea機能については、実装済みのNote機能同様日常でふと浮かんだ、あるいは目的を持って熟考したひらめきを気軽に書き溜めていけるようにしたいと考えています。
それに加えて、登録したアイデア群の中からランダムで2つ取り出し、その異質なもの同士を結合して新たなアイデアを考えられないかユーザーに問う「イノベーション訓練機能」も追加したいと考えています。
また、今後も別のアプリケーションの作成等にも取り組み、プログラミングの技能を磨いていきたいです。

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| affiliation        | string | null: false |

### Association

- has_many :notes
- has_many :experiments
- has_many :plans
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages


## notes テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| word       | string     | null: false                    |
| word_kana  | string     | null: false                    |
| summary    | text       |                                |
| text       | text       |                                |
| reference  | text       |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## ideas テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| idea       | string     | null: false                    |
| detail     | text       |                                |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## experiments テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| datetime            | datetime   | null: false                    |
| weather_id          | integer    |                                |
| temperature         | float      |                                |
| humidity            | float      |                                |
| member              | string     |                                |
| title               | string     | null: false                    |
| purpose             | text       |                                |
| experimental_method | text       |                                |
| condition1          | text       |                                |
| condition2          | text       |                                |
| result              | text       |                                |
| consideration       | text       |                                |
| note                | text       |                                |
| user                | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## schedules テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| datetime       | datetime   | null: false                    |
| plan           | string     | null: false                    |
| memo           | text       | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages


## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user
