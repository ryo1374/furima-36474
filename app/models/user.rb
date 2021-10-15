class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '. Include both letters and numbers' }

  with_options presence: true do
    validates :nickname
    validates :last_name,  format: { with: /\A[一-龥ぁ-ん]/, message: 'is invalid. Input full-width characters' }
    validates :first_name, format: { with: /\A[一-龥ぁ-ん]/, message: 'is invalid. Input full-width characters' }
    validates :last_kana,  format: { with: /\A[ァ-ヴー]+\z/u, message: 'is invalid. Input full-width katakana characters' }
    validates :first_kana, format: { with: /\A[ァ-ヴー]+\z/u, message: 'is invalid. Input full-width katakana characters' }
    validates :birthday
  end
end
