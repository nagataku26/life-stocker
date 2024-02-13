## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |

## Association

- has_many :user_lists
- has_many :lists, through: :user_lists

## listsテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| list_name       | string | null: false |
| shared_id       | string |             |
| shared_password | string |             |

## Association

- has_many :user_lists
- has_many :users, through: :user_lists
- has_many :items

## user_listsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| list                | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :list

## itemsテーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| stock_count         | string     | null: false                    |
| stock_place         | string     |                                |
| purchase_id         | integer    | null:false                     |
| purchase_date       | date       |                                |
| expiration_id       | integer    | null: false                    |
| expiration_date     | date       |                                |
| purchase_plan       | boolean    |                                |
| purchase_plan_count | string     |                                |
| url                 | string     |                                |
| memo                | text       |                                |
| list                | references | null: false, foreign_key: true |

## Association

- belongs_to :list