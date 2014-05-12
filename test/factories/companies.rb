# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }

    factory :limited_company, class: LimitedCompany do
      supporting_document
    end
  end

  trait :without_supporting_document do
    supporting_document nil
  end
end
