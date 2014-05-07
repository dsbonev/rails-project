require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count', +1) do
      post :create, format: :json, customer: { broker_ids: [create(:broker).id] }
      assert_response :success, response.body
    end
  end

  test "should show customer" do
    get :show, id: create(:customer)
    assert_response :success
  end
end
