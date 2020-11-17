require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it 'postalが空だと保存できないこと' do
      @order_address.postal = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal can't be blank")
    end
    
    it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal is invalid")
    end
    
    it 'area_idを選択していないと保存できないこと' do
      @order_address.area_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Area must be other than 1")
    end
    
    it 'building_nameは空でも保存できること' do
      @order_address.building_name = ""
      expect(@order_address).to be_valid
    end
    
    it 'blockが空だと保存できないこと' do
      @order_address.block = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank")
    end
    
    it 'tell_numが空だと保存できないこと' do
      @order_address.tell_num = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Tell num can't be blank")
    end
    
    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
