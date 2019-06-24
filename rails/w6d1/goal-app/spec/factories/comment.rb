FactoryBot.define do 
  factory :comment do
    body { Faker::Movie.quote }

    association :user factory: :user
    association :goal factory: :goal
  end
end