FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    area_id { 2 }
    municipalities { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
