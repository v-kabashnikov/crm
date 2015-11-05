class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
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
      redirect_to @order, notice: 'Speciality was successfully created.'
    else
      render :new
    end
  end


  # POST /orders


  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # def order_params_manager
  #   order_params.permit(:client_id, :employee_id, :employee_deadline, :inform_date, :status, :price)
  # end

  def order_params
    params.require(:order).permit(:worktype_id, :wortype_other, :speciality_id, :speciality_other,
                                  :institution, :theme, :uniqueness, :document, :comment, :deadline,
                                  :page_number)
  end

  # Only allow a trusted parameter "white list" through.


end
