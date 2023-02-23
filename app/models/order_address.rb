class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode,:area_id,:municipalities,:address,:building,:phone_number,:user_id,:item_id,:token
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :municipalities
    validates :address
    validates :phone_number,format: {with: /\A[0-9]+\z/ }, length: { in: 10..11 }
    validates :area_id, numericality: { other_than: 0 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    # 学習メモ：user・iteｍIDを保存し、変数purchasesに代入する
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 学習メモ：order情報を保存する
    # donation_idには、変数donationのidと指定する
    Order.create(postcode: postcode, municipalities: municipalities, address: address, phone_number: phone_number, building: building,area_id: area_id,purchase_id: purchase.id)
  end

end