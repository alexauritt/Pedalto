class Document < ActiveRecord::Base
  has_attached_file :document_image
  
  def next
    next_doc = Document.where("id > #{self.id}").limit(1).order("id ASC")
    next_doc.empty? ? Document.first : next_doc.first
  end
  
  def previous
    previous_doc = Document.where("id < #{self.id}").limit(1).order("id DESC")
    previous_doc.empty? ? Document.last : previous_doc.first    
  end
end
