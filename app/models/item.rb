class Item < ApplicationRecord
  validates :item_name, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    format: { with: /\A[0-9]+\z/ }
  validates :detail, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :states_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 0 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :sipping_day_id, numericality: { other_than: 1 }
  validates :image, presence: true

  has_one :purchase
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :states

end
