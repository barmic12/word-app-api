FactoryBot.define do
  factory :list do
    name { 'Top 1000' }
    description { "The most usefull words." }
    association :user, factory: :user
  end
end
