require 'test_helper'

class CustomerRegistrationFormTest < ActionDispatch::IntegrationTest
  setup do
    create :broker
    visit new_customer_path
  end

  should 'proceed on valid brokers selected' do
    first('.customer_brokers.check_boxes input[type=checkbox]').set(true)
    proceed
    assert_equal customer_path(Customer.order(:id).last), current_path
  end

  context 'when no brokers selected' do
    should 'not proceed' do
      proceed
      assert_equal url_for(controller: 'customers', action: 'create', only_path: true), current_path
    end
  end

  def proceed
    click_on 'Create Customer'
  end
end
