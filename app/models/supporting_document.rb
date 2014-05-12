class SupportingDocument < ActiveRecord::Base
  belongs_to :company
  validates :file, presence: true
end
