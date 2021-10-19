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
    validates :category_id,  numericality: { other_than: 1, message: "can't be blank" } 
    validates :status_id,  numericality: { other_than: 1, message: "can't be blank" } 
    validates :fee_id,  numericality: { other_than: 1, message: "can't be blank" } 
    validates :area_id,  numericality: { other_than: 1, message: "can't be blank" } 
    validates :ship_id,  numericality: { other_than: 1, message: "can't be blank" } 
  end

    validates :price, numericality: { with: /\A[0-9]+\z/,message: 'is invalid. Input half-width characters' }
    validates :price, numericality: { greater_than: 299, less_than: 10000000, message: 'is out of setting range' }

 
  
end
