class AddPhotoToDocumentModel < ActiveRecord::Migration
  def self.up
    add_column :documents, :document_image_file_name, :string
    add_column :documents, :document_image_content_type, :string
    add_column :documents, :document_image_file_size, :integer
  end

  def self.down
    remove_column :documents, :document_image_file_size
    remove_column :documents, :document_image_content_type
    remove_column :documents, :document_image_file_name
  end
end
