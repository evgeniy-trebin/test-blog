FactoryGirl.define do
  PASSWORD = Faker::Internet.password(10, 20)
  factory :user do
    email { Faker::Internet.email }
    password { PASSWORD }
    password_confirmation { PASSWORD }
  end
end
