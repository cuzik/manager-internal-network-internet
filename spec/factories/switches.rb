FactoryBot.define do
  factory :switch do
    name { Faker::Name.unique.name }
    mac_address { Faker::Internet.mac_address }

    account
  end
end
