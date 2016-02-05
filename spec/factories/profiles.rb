FactoryGirl.define do
  factory :profile do
    user
    factory :full_profile do
      name { Faker::Name.first_name }
      surname { Faker::Name.last_name }
      nickname { Faker::Name.name }
      status_text { Faker::Hipster.sentence }
    end
  end

end
