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
* category_id   (integer型, null: false,)
* status_id    (integer型, null: false)
* fee_id   (integer型, null: false)
* area_id   (integer型, null: false)
* ship_id   (integer型, null: false)
* price   (integer型, null: false)
* user   (reference型, null: false,外部キー)

### Association

- belongs_to :user
- has_one :item, through: :order_user


## ordersテーブル

* postal_code   (string型, null: false)
* area_id   (integer型, null: false)
* municipalities   (string型, null: false)
* address   (string型, null: false)
* building_name   (text型)
* phone_number   (string型, null: false)

### Association

- has_one :order_user

## order_usersテーブル
* user   (reference型, null: false, 外部キー)
* order   (reference型, null: false, 外部キー)

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :order