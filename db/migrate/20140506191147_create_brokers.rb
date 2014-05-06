class CreateBrokers < ActiveRecord::Migration
  def change
    create_table :brokers do |t|

      t.timestamps
    end
  end
end
