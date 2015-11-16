class Part < ActiveRecord::Base
  belongs_to :order
  has_attached_file :file
  validates_attachment_file_name :file, :matches => [/docx?\Z/, /pdf\Z/, /xlsx?\Z/]
  enum status: %i[waiting moderation approved rework denied]
end
