FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password 'foobarbaz'

    factory :consumer do
      type 'Consumer'
    end

    factory :service_provider do
      type 'ServiceProvider'
    end
  end
end
