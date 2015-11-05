class Client < User
  has_many :orders, class_name: "Order", foreign_key: "client_id"
end
