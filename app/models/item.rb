class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :payment
  belongs_to :send_day
  belongs_to :status

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :image
    validates :explanation, length: { maximum: 1000 }
    PRICE_REGEX = /\A[0-9]+\z/.freeze
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }, format: { with: PRICE_REGEX }
  end

  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :category_id
    validates :payment_id
    validates :send_day_id
    validates :status_id
  end
end
