FactoryBot.define do
  factory :port do
    number { Faker::Number.number(10) }

    switch
  end
end
