class Employee < User
  belongs_to :speciality
  has_many :orders, class_name: "Order", foreign_key: "employee_id"
end
