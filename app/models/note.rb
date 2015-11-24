class Note < ActiveRecord::Base
  belongs_to :manager, class_name: 'User'
  belongs_to :order, class_name: 'User'

  after_save :add_event
  def add_event
    event_params = { :user_id => self.manager_id, :event_type => "note", :content  => self.content, :link => "orders/#{self.order_id}" }
    event = Event.new(event_params)
    event.save
  end
end
