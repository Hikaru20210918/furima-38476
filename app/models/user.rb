class User < ApplicationRecord
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A([ぁ-んァ-ヶ一-龠々]|ー)+\z/ }
    validates :last_name, format: { with: /\A([ぁ-んァ-ヶ一-龠々]|ー)+\z/ }
    validates :first_name_kana, format: { with: /\A([ァ-ヶ]|ー)+\z/ }
    validates :last_name_kana, format: { with: /\A([ァ-ヶ]|ー)+\z/ }
    validates :birthday
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   has_many :items
   has_many :purchases
  #has_many :purchases
end
