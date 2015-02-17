class AddFileAttachmentToSupportingDocument < ActiveRecord::Migration
  def self.up
    add_attachment :supporting_documents, :file
  end

  def self.down
    remove_attachment :supporting_documents, :file
  end
end
