class User < ActiveRecord::Base
  ROLES = ['admin', 'manager', 'employee', 'client']
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  self.inheritance_column = 'role'
end