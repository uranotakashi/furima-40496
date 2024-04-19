class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々ー]+\z/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze

  validates :nickname, presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :chinese_character_last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :chinese_character_first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :katakana_last_name, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :katakana_first_name, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :date_of_birth, presence: true

  validates :nickname, presence: true

  validates :email, uniqueness: true
end