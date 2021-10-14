class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[一-龥ぁ-ん]/, message: "is invalid. Input full-width characters" }
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :birthday
  end
end
