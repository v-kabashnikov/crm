class DashboardController < ApplicationController
  def index
    case current_user.role
    when 'Admin'
      redirect_to users_path
    when 'Client'
      @orders = current_user.orders
      render 'dashboard/client/orders'
    when 'Manager'
      @orders = Order.all
      render 'dashboard/manager/orders'
    when 'Employee'
      @orders = current_user.orders
      render 'dashboard/employee/my_orders'
    end
  end
  def create_order
    @order = Order.new
    render "dashboard/#{current_user.role.downcase}/create_order"
  end
end
