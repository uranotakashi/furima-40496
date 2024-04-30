FactoryBot.define do
  factory :purchase_shipping_address do
    zip_code { '123-4567' }    
    delivery_area_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09083825687' }
    association :user
    association :item
    token {"tok_abcdefghijk00000000000000000"}
  end
end