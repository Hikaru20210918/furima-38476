class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },format: { with: /\A[0-9]+\z/ }
  validates :detail, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :area_id, presence: true
  validates :postage_id, presence: true
  validates :sipping_day_id, presence: true
  validates :image, presence: true
  

  has_one :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
end
