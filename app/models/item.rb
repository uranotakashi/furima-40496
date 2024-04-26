class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :situation
  validates :situation_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :shipping_fee
  validates :shipping_fee_id, numericality: { other_than: 1 , message: "can't be blank"}

  belongs_to :delivery_area
  validates :delivery_area_id, numericality: { other_than: 1 , message: "can't be blank"} 

  belongs_to :delivery_date
  validates :delivery_date_id, numericality: { other_than: 1 , message: "can't be blank"}

  # has_one :purchase

end