class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /orders
  def index
    @orders = Order.paginate(:page => params[:page])
  end

  # GET /orders/1
  def show
      @commentary = Commentary.find_by_order_id(@order.id)
      @note = Note.find_by_order_id(@order.id)

    puts @order.status
    if @order.status == 'moderation'
      render 'orders/show'
    else
      render "dashboard/order"
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.client_id = current_user.id if current_user.role == "Client"

    if @order.save
      redirect_to @order, notice: 'Заказ успешно создан.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Заказ успешно обновлен.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to dashboard_index_path, notice: 'Заказ успешно удален'
  end

  def change_status
    if Order.statuses.map(&:first).include? params[:status]
      @order.update(status: params[:status].to_sym)
      if params[:status] == 'approved'
        @order.update(manager_id: current_user.id)
      end
      redirect_to @order, notice: 'Статус заказа изменен'
    end
  end

  def set_employee
    @order.update(employee_id: params[:employee_id], status: :in_work)

    redirect_to @order, notice: 'Исполнитель назначен'
  end

  def unset_employee
    @order.update(employee_id: nil, status: :approved)
    redirect_to @order, notice: 'Исполнитель снят'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    permitted_arr = [:worktype_id, :worktype_other, :speciality_id, :speciality_other,
                     :institution, :theme, :uniqueness, :document, :comment, :deadline, :page_number]
    if ["Admin", "Manager"].include?(current_user.role)
      permitted_arr << [:client_id, :employee_id, :employee_deadline, :inform_date, :status, :price]
    end
    params.require(:order).permit(permitted_arr)
  end
end
