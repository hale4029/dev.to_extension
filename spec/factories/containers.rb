FactoryBot.define do
  factory :container do
    name { Faker::Hipster.words(number: 4).join(", ") }
    description { Faker::Hipster.words(number: 10).join(", ") }
    user
  end
end
