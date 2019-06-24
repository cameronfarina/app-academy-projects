FactoryBot.define do 
  factory :goal do
    title { Faker::Internet.title }
    description { Faker::Internet.description }

    association :user, factory: :user
    association :comments, factory: :comment
  end
end