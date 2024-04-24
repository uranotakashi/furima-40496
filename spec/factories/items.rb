FactoryBot.define do
  factory :item do
    
    item_name           { 'Some item name' }
    description         { 'Some description' }
    category_id           {2}
    situation_id           {2}
    shipping_fee_id           {2}
    delivery_area_id           {2}
    delivery_date_id           {2}
    price           {99999}

    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open("#{Rails.root}/public/images/test_image.jpg"), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
  end
end
