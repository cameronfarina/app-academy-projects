FactoryBot.define do 
  factory :user do
    username { Faker::Internet.user_name }
    password { 'hunter2' }
  end
end