# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
  end

  trait :without_brokers do
    brokers []
  end
end
