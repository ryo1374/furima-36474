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
    validates :price
  end

    validates :price, numericality: { with: /\A[0-9]+\z/,message: 'is invalid. Input half-width characters' }
    validates :price, numericality: { greater_than: 300, less_than: 9999999, message: 'is out of setting range' }

  validates :category_id, :status_id, :fee_id, :area_id, :ship_id,  numericality: { other_than: 1, message: "can't be blank" } 
end
