FactoryBot.define do
  factory :user do
    name { Faker::Games::Overwatch.hero }
  end
end
