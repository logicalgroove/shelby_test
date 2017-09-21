FactoryGirl.define do
  factory :job do
    title "MyString"
    description "MyText"
    price_cents 1
    association :user, factory: :consumer
  end
end
