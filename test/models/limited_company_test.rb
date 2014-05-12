require 'test_helper'

class LimitedCompanyTest < ActiveSupport::TestCase
  should 'require supporting document' do
    limited_company = build :limited_company, :without_supporting_document
    assert limited_company.invalid?

    limited_company.supporting_document = build :supporting_document
    assert limited_company.valid?
  end
end
