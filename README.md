# テーブル設計

## users テーブル

* nickname   (string型,NOT NULL)
* email   (string型,NOT NULL,ユニーク制約)
* encrypted_password  (string型,NOT NULL)
* name   (string型,NOT NULL)
* name_kana   (string型,NOT NULL)
* birthday   (date型,NOT NULL)

### Association

- has_many :items
- has_many :comments
- has_one  :order


## itemsテーブル

* item_name   (string型,NOT NULL)
* item_description   (text型,NOT NULL)
* price   (integer型, NOT NULL)
* user   (reference型, NOT NULL,外部キー)

### Association

- belongs_to :user
- belongs_to :order
- has_many  :comments

## ordersテーブル

* postal_code   (integer型, NOT NULL)
* municipalities   (string型, NOT NULL)
* address   (string型, NOT NULL)
* building_name   (text型,NOT NULL)
* phone_number   (integer型, NOT NULL)
* user   (reference型, NOT NULL,外部キー)
* item   (reference型, NOT NULL,外部キー)

### Association

- belongs_to :user
- belongs_to :item

