class Part < ActiveRecord::Base
  belongs_to :order
  has_attached_file :file
  validates_attachment_file_name :file, :matches => [/docx?\Z/, /pdf\Z/, /xlsx?\Z/]
  enum status: %i[waiting moderation approved rework denied]

  def self.status_names_for_select
    names = []
    statuses.keys.each do |status|
      display_name = I18n.t("activerecord.attributes.#{self.name.downcase}.statuses.#{status}", default: status.titleize)
      names << [display_name, status]
    end
    names
  end
end
