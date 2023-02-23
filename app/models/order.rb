class Order < ApplicationRecord
  attr_accessor :token

  validates :postcode, presence: true,format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true,format: {with: /\A[0-9]+\z/ }, length: { maximum: 10 }
  validates :purchase, presence: true
  validates :area_id, presence: true,numericality: { other_than: 0 }

  belongs_to :purchase
end
