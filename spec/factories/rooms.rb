FactoryBot.define do
  factory :room do
    name { Faker::Name.unique.name }

    account
  end
end
