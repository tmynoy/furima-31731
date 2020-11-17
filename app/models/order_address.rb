class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :municipalities, :building_name, :block, :tell_num, :item_id, :token, :user_id


  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipalities
    validates :block
    validates :tell_num, format: {with: /\A\d{10,11}\z/ }
    validates :token
    validates :item_id
    validates :user_id
  end
  validates :area_id, numericality: { other_than: 1 }


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal: postal, area_id: area_id, municipalities: municipalities, building_name: building_name, block: block, tell_num: tell_num, order_id: order.id)
  end
end