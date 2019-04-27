FactoryBot.define do
  factory :account do
    name { Faker::Superhero.name }
  end
end
