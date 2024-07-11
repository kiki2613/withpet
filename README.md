# アプリケーション名　
With pet

# アプリケーション概要
ペットOKの飲食店の検索、ログインすることでお気に入り登録やレビューの投稿ができる。

# URL
















# テーブル設計

## usersテーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| nickname           | string  | null: false  |
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false  |
| age_id             | integer |              |
| gender_id          | integer |              |

### association

- has_many :reviews
- has_many :favorites


## shopsテーブル

| Column          | Type     | Options         |
|-----------------|----------|-----------------|
| name            | string   | null: false     |
| address         | string   | null: false     |
| nearest_station | text     | null: false     |
| image_path      | string   | null: false     |
| time_to_station | integer  |                 |
| phone_number    | string   |                 |
| opening_times   | string   |                 |
| closing_days    | string   |                 |
| attention       | text     |                 |


### association

- has_many :reviews
- has_many :favorites


## reviewsテーブル

| Column     | Type       | Options         |
|------------|------------|-----------------|
| user_id    | references | null: false, foreign_key: true |
| shop_id    | references | null: false, foreign_key: true |
| visit_date | Date       | null: false     |
| comment    | text       | null: false     |

*imageはActive storageで実装

### association

- belongs_to :user
- belongs_to :shop


## favoritesテーブル

| Column    | Type        | Options         |
|-----------|-------------|-----------------|
| user_id   | references  | null: false, foreign_key: true |
| shop_id   | references  | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :shop