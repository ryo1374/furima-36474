FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_kana  { 'ヤマダ' }
    first_kana { 'タロウ' }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
