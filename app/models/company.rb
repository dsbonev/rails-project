class Company < ActiveRecord::Base
  has_one :supporting_document

  validates :name, presence: true
end
