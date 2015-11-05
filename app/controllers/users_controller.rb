class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    # @users = User.where.not(id: current_user.id)
    @users = User.paginate(page: params[:page], per_page: 15)
    # @user_lists = {
    #   clients: Client.paginate(page: params[:page], per_page: 10),
    #   employees: Employee.paginate(page: params[:page], per_page: 10)
    # }
  end

  def manage
    # @users = User.where.not(id: current_user.id)
    @users = User.paginate(page: params[:page], per_page: 15)
    # @user_lists = {
    #   clients: Client.paginate(page: params[:page], per_page: 10),
    #   employees: Employee.paginate(page: params[:page], per_page: 10)
    # }
  end

  def new
    @user = User.new
  end

  def create
    puts '1' * 100
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to users_path
    else
      render action: 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    parms = user_params
    parms.delete(:password) if parms[:password].blank?
    parms.delete(:password_confirmation) if parms[:password].blank? and parms[:password_confirmation].blank?
    if @user.update_attributes(parms)
      flash[:notice] = "Successfully updated User."
      redirect_to action: :index
    else
      render action: 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to :back
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:role, :email, :password, :name, :phone, :skype, :city, :speciality_id)
  end
end
