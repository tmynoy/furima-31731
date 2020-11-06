#テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name       | string  | null: false |
| last_name        | string  | null: false |
| first_name_check | string  | null: false |
| last_name_check  | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| price       | integer    | null: false                    |
| payment     | string     | null: false                    |
| area        | string     | null: false                    |
| send_days   | string     | null: false                    |
| explanation | text       | null: false                    |
| user_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_num       | integer    | null: false                    |
| exp_month      | integer    | null: false                    |
| exp_year       | integer    | null: false                    |
| security       | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |
| address_id     | references | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal         | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| building_name  | string     | null: false                    |
| block          | string     | null: false,                   |
| tell_num       | integer    | null: false,                   |

### Association
- belongs_to :order