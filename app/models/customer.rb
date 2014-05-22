class Customer < ActiveRecord::Base

  concerning :Brokers do
    included do
      BROKER_MAX_COUNT = 3

      has_and_belongs_to_many :brokers

      validates :brokers, presence: true,
                          length: {maximum: BROKER_MAX_COUNT, message: 'Too many brokers per customer selected'}
    end
  end

  concerning :CompanyAssociation do
    included do
      has_one :company

      validates :company, presence: true

      accepts_nested_attributes_for :company
    end
  end
end
