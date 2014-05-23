class CreateAssociates < ActiveRecord::Migration
  def change
    create_table :associates do |t|
      t.text :name
      t.references :company, index: true

      t.timestamps
    end
  end
end
