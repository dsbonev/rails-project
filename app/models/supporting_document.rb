class SupportingDocument < ActiveRecord::Base
  belongs_to :company, foreign_key: 'company_id'
  validates :file, presence: true

  has_attached_file :file
  do_not_validate_attachment_file_type :file
end
