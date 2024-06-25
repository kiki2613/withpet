# テーブル設計

## usersテーブル

| Column             | Type    | Options      |
| ------------------ | ------- | ------------ |
| nickname           | string  | null: false  |
| email              | string  | null: false, unique: true  |
| encrypted_password | string  | null: false  |
| gender             | string  |              |
| prefecture_id      | integer |              |

### association

- has_many :reviews
- has_many :favorites


## cafesテーブル

| Column        | Type     | Options         |
|---------------|----------|-----------------|
| name          | string   | null: false     |
| address       | string   | null: false     |
| image         | text     | null: false     |
| prefecture_id | integer  | null: false     |

### association

- has_many :reviews


## reviewsテーブル

| Column     | Type       | Options         |
|------------|------------|-----------------|
| user_id    | references | null: false, foreign_key: true |
| cafe_id    | references | null: false, foreign_key: true |
| visit_date | Date       | null: false     |
| comment    | text       | null: false     |

### association

- belongs_to :user
- belongs_to :cafe


## favoritesテーブル

| Column    | Type        | Options         |
|-----------|-------------|-----------------|
| user_id   | references  | null: false, foreign_key: true |
| cafe_id   | references  | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :cafe