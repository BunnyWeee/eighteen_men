FactoryBot.define do
  factory :mission do
    user { User.first }
    name { Faker::Games::LeagueOfLegends.champion }
  end
end
