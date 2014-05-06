class CreateJoinTableBrokerCustomer < ActiveRecord::Migration
  def change
    create_join_table :brokers, :customers do |t|
      t.index [:customer_id, :broker_id]
    end
  end
end
