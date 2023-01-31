class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :nickname, presence: true
  validates :first_name, presence: true , format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
  validates :last_name, presence: true  , format: { with: /\A([ぁ-んァ-ン一-龥]|ー)+\z/}
  validates :first_name_kana, presence: true , format: { with:  /\A([ァ-ン]|ー)+\z/}
  validates :last_name_kana, presence: true , format: { with: /\A([ァ-ン]|ー)+\z/}
  validates :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
