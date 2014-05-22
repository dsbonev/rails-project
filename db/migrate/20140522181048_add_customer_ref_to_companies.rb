class AddCustomerRefToCompanies < ActiveRecord::Migration
  def change
    add_reference :companies, :customer, index: true
  end
end
