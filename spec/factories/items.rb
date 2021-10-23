FactoryBot.define do
  factory :item do
    item_name { '商品1' }
    item_description  { '商品の説明' }
    category_id       { 2 }
    status_id          { 2 }
    fee_id             { 2 }
    area_id            { 2 }
    ship_id           { 2 }
    price             { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
