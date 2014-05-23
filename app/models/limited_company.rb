class LimitedCompany < Company
  validates :supporting_document, presence: true

  concerning :Directors do
    included do
      has_many :directors, foreign_key: 'company_id'
      validates :directors, presence: true,
                            length: {maximum: 4, message: 'Too many directors'}
      accepts_nested_attributes_for :directors
    end
  end
end
