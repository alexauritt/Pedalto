# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

def load_document_images
  Document.all.each do |doc|
    file_path = File.join(Rails.root, 'public', 'images', 'document_scans', doc.document_image_file_name)
    doc.document_image = File.open(file_path)
    doc.save!
  end
end

seed_file = File.join(Rails.root, 'db', 'seed_data', 'departments.yml')
config = YAML::load_file(seed_file)
Department.create(config["departments"])

seed_file = File.join(Rails.root, 'db', 'seed_data', 'documents.yml')
config = YAML::load_file(seed_file)
Document.create(config["documents"])

load_document_images
