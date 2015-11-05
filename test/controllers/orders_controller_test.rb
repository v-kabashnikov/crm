require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { comment: @order.comment, deadline: @order.deadline, file: @order.file, institution: @order.institution, page_number: @order.page_number, speciality_id: @order.speciality_id, speciality_other: @order.speciality_other, theme: @order.theme, uniqueness: @order.uniqueness, worktype_id: @order.worktype_id, wortype_other: @order.wortype_other }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { comment: @order.comment, deadline: @order.deadline, file: @order.file, institution: @order.institution, page_number: @order.page_number, speciality_id: @order.speciality_id, speciality_other: @order.speciality_other, theme: @order.theme, uniqueness: @order.uniqueness, worktype_id: @order.worktype_id, wortype_other: @order.wortype_other }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
