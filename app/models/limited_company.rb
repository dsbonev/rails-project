class LimitedCompany < Company
# Registration number
# Email address
# Names of up to 4 Directors*
  validates :supporting_document, presence: true
end
