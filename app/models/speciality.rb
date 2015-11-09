class Speciality < ActiveRecord::Base
  has_many :employees
  has_many :orders
  def to_s
    self.name
  end
end
