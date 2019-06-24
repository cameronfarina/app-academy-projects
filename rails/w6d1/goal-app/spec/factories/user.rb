FactoryBot.define do 
  factory :user do
    username { Faker::Internet.user_name }
    password { 'hunter2' }
    
    association :goals, factory: :goal
    association :comments, factory: :comment
  end
end