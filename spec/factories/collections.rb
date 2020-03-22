FactoryBot.define do
  factory :collection do
    description { Faker::Hipster.words(number: 4).join(", ") }
    user
    sequence(:slug) { |n| "slug-#{n}" }
  end

  trait :with_articles do
    after(:create) do |collection|
      create_list(:article, 3, with_collection: collection, user: collection.user)
    end
  end
end
