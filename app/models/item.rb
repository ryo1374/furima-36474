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
    validates :item_name
    validates :item_description
    validates :category_id
    validates :status_id
    validates :fee_id
    validates :area_id
    validates :ship_id
    validates :price
  end

  validates :category_id, :status_id, :fee_id, :area_id, :ship_id,  numericality: { other_than: 1, message: "can't be blank" } 
end
