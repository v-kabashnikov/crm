class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :order, class_name: 'User'
  enum status: %i[moderation approved denied]

  def sender_role

  end
end
