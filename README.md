#テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_check   | string  | null: false |
| last_name_check    | string  | null: false |
| birthday           | date    | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| category_id  | integer    | null: false                    |
| status_id    | integer    | null: false                    |
| price        | integer    | null: false                    |
| payment_id   | integer    | null: false                    |
| area_id      | integer    | null: false                    |
| send_days_id | integer    | null: false                    |
| explanation  | text       | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal         | string     | null: false                    |
| area_id        | integer    | null: false                    |
| municipalities | string     | null: false                    |
| building_name  | string     |                                |
| block          | string     | null: false                    |
| tell_num       | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association
- belongs_to :order