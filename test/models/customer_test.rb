require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  context 'brokers' do
    should 'be present' do
      customer = build :customer, :without_brokers
      assert customer.invalid?

      customer.brokers << build(:broker)
      assert customer.valid?
    end
  end
end
