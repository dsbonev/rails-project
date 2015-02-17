class Trust < Company

  concerning :Trustees do
    included do
      has_many :trustees, foreign_key: 'company_id'
      accepts_nested_attributes_for :trustees
    end
  end

end
