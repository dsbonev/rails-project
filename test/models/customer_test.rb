require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  context 'brokers' do
    should 'be present' do
      customer = build :customer, :without_brokers
      assert customer.invalid?

      customer.brokers << build(:broker)
      assert customer.valid?, customer.errors.full_messages
    end

    should "be #{Customer::BROKER_MAX_COUNT} at most" do
      customer = build :customer, :with_max_brokers
      assert customer.valid?, customer.errors.full_messages

      customer.brokers << build(:broker)
      assert customer.invalid?
    end

    should 'be associated via :update_attributes' do
      customer = build :customer, :without_brokers
      assert_difference 'customer.brokers.count', +1 do
        updated = customer.update_attributes broker_ids: [create(:broker).id]
        assert updated, customer.errors.full_messages
      end
    end
  end
end
