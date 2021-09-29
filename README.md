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

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| datetime      | datetime   | null: false                    |
| weather_id    | integer    |                                |
| temperature   | float      |                                |
| humidity      | float      |                                |
| member        | string     |                                |
| title         | string     | null: false                    |
| purpose       | text       |                                |
| method        | text       |                                |
| condition1    | text       |                                |
| condition2    | text       |                                |
| result        | text       |                                |
| consideration | text       |                                |
| note          | text       |                                |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## schedules テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| date           | date       | null: false                    |
| plan           | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## rooms テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| room_name   | string | null: false |

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
