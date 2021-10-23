class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :ship

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
    validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :status_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :fee_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :area_id,  numericality: { other_than: 1, message: "can't be blank" }
    validates :ship_id,  numericality: { other_than: 1, message: "can't be blank" }
  end

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  end
end
