class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :product_id, :postal_code, :prefecture_id, :municipalitie, :address, :building, :phone_number

  NUMBER_GOSIC = /\A[0-9０−９]+\z/.freeze
  POSTAL_VALIDATE = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  PASSWORD_FULL_WIDTH = /\A[ぁ-ん一-龥]+\z/.freeze
  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_VALIDATE }
    validates :municipalitie, format: { with: PASSWORD_FULL_WIDTH, message: 'は全角で入力してください。' }
    validates :address
    validates :phone_number, format: { with: NUMBER_GOSIC }, length: { maximum: 11 }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: 'を選択してください'}
  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalitie: municipalitie, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
