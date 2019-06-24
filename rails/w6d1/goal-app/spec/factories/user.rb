FactoryBot.define do 
  factory :user do
    email { Faker::Internet.email }
    password { 'hunter2' }

  end
end