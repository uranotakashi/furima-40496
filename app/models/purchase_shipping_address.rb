class PurchaseShippingAddress
  include ActiveModel::Model
  attr_accessor :user, :item, :delivery_area_id, :zip_code, :city, :house_number, :building_name, :telephone_number, :token

  with_options presence: true do
  validates :zip_code,  format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
  validates :city
  validates :house_number
  validates :telephone_number, presence: { message: "Phone number can't be blank" }, length: { minimum: 10, maximum: 11, too_short: 'Phone number is too short', too_long: 'Phone number is too long' }, format: { with: /\A\d{10,11}\z/, message: "Phone number is invalid. Input only number" }
  validates :token
  validates :user
  validates :item
  end

  validates :delivery_area_id, numericality: { other_than: 1, message: 'must be selected' }

  def save
    purchase = Purchase.create(item: item, user: user)
    ShippingAddress.create(purchase: purchase, delivery_area_id: delivery_area_id, zip_code: zip_code, city: city, house_number: house_number, building_name: building_name, telephone_number: telephone_number)
  end
end

