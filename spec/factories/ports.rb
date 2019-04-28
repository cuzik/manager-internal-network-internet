FactoryBot.define do
  factory :port do
    number { Faker::Number.number(4) }

    switch
  end
end
