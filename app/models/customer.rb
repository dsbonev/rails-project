class Customer < ActiveRecord::Base
  has_and_belongs_to_many :brokers

  validates :brokers, presence: true
end
