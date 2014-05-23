class AddTypeToAssociates < ActiveRecord::Migration
  def change
    add_column :associates, :type, :string
  end
end
