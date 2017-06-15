class UsersController < ApplicationController
  layout 'dashboard'
  add_breadcrumb "Dashboard", :dashboard_path
  add_breadcrumb "User", '#'

  def index
    @user = User.all
  end

  def new
    add_breadcrumb "Add User", '#'
    @user = User.new
  end

  def edit
    add_breadcrumb "Edit User", '#'
    @user = User.friendly.find(params[:id])
  end

  def show
    add_breadcrumb "Profile", '#'
    @user = User.friendly.find(params[:id])
  end

  def update
    @user = User.friendly.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile info was updated"
      redirect_to users_profile_url
    else
      render 'edit'
    end
  end

  def destroy
    User.friendly.find(params[:id]).destroy
    flash[:danger] = "User has been deleted"
    redirect_to users_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Congratulations! add user has been success. "
      redirect_to users_url
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :phone, :status, :gender, :password, :password_confirmation, :avatar)
    end

end
