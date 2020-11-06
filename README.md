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
| birthday           | integer | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| category    | integer    | null: false                    |
| status      | integer    | null: false                    |
| price       | integer    | null: false                    |
| payment     | integer    | null: false                    |
| area        | integer    | null: false                    |
| send_days   | integer    | null: false                    |
| explanation | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

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
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| building_name  | string     | null: true                     |
| block          | string     | null: false                    |
| tell_num       | string     | null: false                    |

### Association
- belongs_to :order