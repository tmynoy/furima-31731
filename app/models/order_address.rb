class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :municipalities, :building_name, :block, :tell_num

  # バリデーション入力
  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipalities
    validates :block
    validates :tell_num, format: {with: /\A\d{10,11}\z/ }
    validates :postal
  end
  validates :area_id, numericality: { other_than: 1 }
  
  # バリデーション入力

  def save
    user = User.find(current_user.id)
    Order.create(user_id: current_user.id, item_id: item.id)
    Address.create(:postal, :area_id, :municipalities, :building_name, :block, :tell_num, order_id: order.id)
  end
end