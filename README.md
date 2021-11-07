# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_kana          | string | null: false              |
| first_kana         | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders


## itemsテーブル

| Column             | Type      |  Options                       |
| ------------------ | --------- | ------------------------------ |
| item_name          | string    | null: false                    |
| item_description   | text      | null: false                    |
| category_id        | integer   | null: false                    |
| status_id          | integer   | null: false                    |
| fee_id             | integer   | null: false                    |
| area_id            | integer   | null: false                    |
| ship_id            | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## addressesテーブル

| Column             | Type      |  Options                       |
| ------------------ | --------- | ------------------------------ |
| postal_code        | string    | null: false                    |
| area_id            | integer   | null: false                    |
| municipalities     | string    | null: false                    |
| address            | string    | null: false                    |
| building_name      | text      |                                |
| phone_number       | string    | null: false                    |
| order               | reference | null: false, foreign_key: true |

### Association

- belongs_to :order

## ordersテーブル

| Column             | Type      |  Options                       |
| ------------------ | --------- | ------------------------------ |
| user               | reference | null: false, foreign_key: true |
| item               | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address