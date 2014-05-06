class Customer < ActiveRecord::Base

  concerning :Brokers do
    included do
      BROKER_MAX_COUNT = 3

      has_and_belongs_to_many :brokers

      validates :brokers, presence: true,
                          length: {maximum: BROKER_MAX_COUNT}
    end
  end
end
