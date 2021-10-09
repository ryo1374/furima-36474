# テーブル設計

## users テーブル

* nickname   (string型, null: false)
* email   (string型, null: false,ユニーク制約)
* encrypted_password  (string型,null: false)
* last_name   (string型, null: false)
* first_name   (string型, null: false)
* last_kana   (string型, null: false)
* first_kana   (string型, null: false)
* birthday   (date型, null: false)

### Association

- has_many :items
- has_many :users, through: :order_users


## itemsテーブル

* item_name   (string型,NOT NULL)
* item_description   (text型,null: false)
* item_category   (string型, null: false)
* item_status    (string型, null: false)
* delivery_fee   (string型, null: false)
* shipping_area   (string型, null: false)
* days to ship   (string型, null: false)
* price   (integer型, null: false)
* user   (reference型, null: false,外部キー)

### Association

- has_many :users
- has_many :orders, through: :order_users


## ordersテーブル

* postal_code   (integer型, null: false)
* prefectures   (string型, null: false)
* municipalities   (string型, null: false)
* address   (string型, null: false)
* building_name   (text型, null: false)
* phone_number   (integer型, null: false)

### Association

- has_many :items
- has_many :orders, through: :order_users

## order_usersテーブル
* user   (reference型, null: false, 外部キー)
* order   (reference型, null: false, 外部キー)

### Association

- belongs_to :user
- belongs_to :item