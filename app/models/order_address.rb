class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode,:area_id,:municipalities,:address,:building,:phone_number,:user_id,:item_id,:token

  validates :postcode, presence: true,format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :municipalities, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true,format: {with: /\A[0-9]+\z/ }, length: { in: 10..11 }
  validates :area_id, numericality: { other_than: 0 }
  validates :token, presence: true
  validates :user_id, presence: true
  validates :item_id, presence: true

  def save
    # 学習メモ：user・iteｍIDを保存し、変数purchasesに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 学習メモ：order情報を保存する
    # donation_idには、変数donationのidと指定する
    Order.create(postcode: postcode, municipalities: municipalities, address: address, phone_number: phone_number, area_id: area_id,purchase_id: purchase.id)
  end

end