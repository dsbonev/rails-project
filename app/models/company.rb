class Company < ActiveRecord::Base
  belongs_to :customer
  has_one :supporting_document

  validates :name, presence: true
end
