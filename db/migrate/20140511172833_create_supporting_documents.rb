class CreateSupportingDocuments < ActiveRecord::Migration
  def change
    create_table :supporting_documents do |t|
      t.string :file
      t.references :company, index: true

      t.timestamps
    end
  end
end
