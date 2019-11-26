FactoryBot.define do
  factory :mission do
    name { Faker::Games::LeagueOfLegends.champion }
  end
end
