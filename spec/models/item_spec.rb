require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "商品情報を全て入力すれば出品できる" do
      expect(@item).to be_valid
    end
    it "imageなしで出品できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameなしで出品できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it "nameが40文字より多いと出品できない" do
      @item.name = Faker::String.random(length: 41)
      @item.valid?
      expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
    end
    it "explanationなしで出品できない" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "explanationが1000文字より多いと出品できない" do
      @item.explanation = Faker::String.random(length: 1001)
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation is too long (maximum is 1000 characters)")
    end
    it "category_idの選択なしで出品できない" do
      @item.category_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "status_idの選択なしで出品できない" do
      @item.status_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it "payment_idの選択なしで出品できない" do
      @item.payment_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Payment must be other than 1")
    end
    it "area_idの選択なしで出品できない" do
      @item.area_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 1")
    end
    it "send_day_idの選択なしで出品できない" do
      @item.send_day_id = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Send day must be other than 1")
    end
    it "priceなしで出品できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが半角数字でないと出品できない" do
      @item.price = "５００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it "priceが300未満だと出品できない" do
      @item.price = "200"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it "priceが9999999より大きいと出品できない" do
      @item.price = "10000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
  end
end

