class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :document_number
      t.string :title
      t.date :date
      t.integer :department_id

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
