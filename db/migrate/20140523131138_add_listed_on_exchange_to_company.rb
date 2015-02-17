class AddListedOnExchangeToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :listed_on_exchange, :boolean
  end
end
