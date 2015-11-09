class Worktype < ActiveRecord::Base
  has_many :orders
  def to_s
    self.name
  end
end
