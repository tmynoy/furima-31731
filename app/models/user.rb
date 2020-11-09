class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true, length: { maximum: 40 }, uniqueness: { case_sensitive: true }
  validates :email, uniqueness: 1, uniqueness: { case_sensitive: true }

  PASSDWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSDWORD_REGEX }

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_CHECK_REGEX = /\A[ァ-ン]+\z/.freeze
  validates :last_name, presence: true, format: { with: NAME_REGEX }
  validates :first_name, presence: true, format: { with: NAME_REGEX }
  validates :last_name_check, presence: true, format: { with: NAME_CHECK_REGEX }
  validates :first_name_check, presence: true, format: { with: NAME_CHECK_REGEX }

  validates :birthday, presence: true
end
