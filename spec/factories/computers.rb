FactoryBot.define do
  factory :computer do
    name { Faker::Name.unique.name }
    mac_address { Faker::Internet.mac_address('AA') }
    ip { Faker::Internet.private_ip_v4_address }

    room
  end
end
