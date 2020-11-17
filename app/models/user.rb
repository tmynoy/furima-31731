class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname, length: { maximum: 40 }, uniqueness: { case_sensitive: true }
    NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
    NAME_CHECK_REGEX = /\A[ァ-ン]+\z/.freeze
    validates :last_name, format: { with: NAME_REGEX }
    validates :first_name, format: { with: NAME_REGEX }
    validates :last_name_check, format: { with: NAME_CHECK_REGEX }
    validates :first_name_check, format: { with: NAME_CHECK_REGEX }
    validates :birthday
  end
  validates :email, uniqueness: 1, uniqueness: { case_sensitive: true }
  PASSDWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSDWORD_REGEX }
end
