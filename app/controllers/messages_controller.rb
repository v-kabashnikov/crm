class MessagesController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def create
    message = Message.new(message_params)
    order = Order.find(params[:order_id])
    message.sender_id = current_user.id
    if current_user.role == 'Employee'
      message.order_id = order.id if order.employee_id == current_user.id
    elsif current_user.role == 'Client'
      message.order_id = order.id if order.client_id == current_user.id
    end
    unless (['Admin', 'Manager'] & [current_user.role, User.find(message.receiver_id).role]).empty?
      message.status = :approved
    end
    if message.save
      redirect_to order_path(message.order_id), notice: 'Сообщение отправлено'
    else
      redirect_to order_path(message.order_id), notice: 'Ошибка'
    end
  end

  private
  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :receiver_id)
  end
end
