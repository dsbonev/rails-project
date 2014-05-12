class Broker < ActiveRecord::Base
  validates :name, presence: true
end
