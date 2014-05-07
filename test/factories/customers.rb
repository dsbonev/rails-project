# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :customer do
    brokers { create_list(:broker, 1) }
  end

  trait :with_max_brokers do
    after :build do |customer|
      customer.brokers = build_list(:broker, Customer::BROKER_MAX_COUNT)
    end
  end

  trait :without_brokers do
    brokers []
  end
end
