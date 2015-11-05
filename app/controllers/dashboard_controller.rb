class DashboardController < ApplicationController
  def index
    case current_user.role
    when 'Admin'
      redirect_to users_path
    end
  end
  def create_order
    @order = Order.new
    render 'dashboard/client/create_order'
  end
end
