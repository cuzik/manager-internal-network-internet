FactoryBot.define do
  factory :user do
    name { Faker::JapaneseMedia::OnePiece.character }
    cpf { Faker::IDNumber.brazilian_citizen_number(formatted: true) }
    email { Faker::Internet.email }
    password { 'nopasswd' }

    account
  end
end
