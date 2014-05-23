class Partnership < Company
  concerning :Partners do
    included do
      has_many :partners, foreign_key: 'company_id'
      validates :partners, length: {maximum: 4, message: 'Too many partners'}
      accepts_nested_attributes_for :partners
    end
  end

end
