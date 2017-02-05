class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :approve_account,
                                        :pending_users, :promote_to_admin,
                                        :demote_to_user, :deactivate_user,
                                        :reactivate_user, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: [:index, :approve_account, :pending_users,
                                        :promote_to_admin, :demote_to_user,
                                        :deactivate_user, :reactivate_user, :destroy]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account.'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile Updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = 'User Deleted'
    redirect_to users_url
  end

  def pending_users
    # Manager Search
    if params[:search]
      @pending_users = User.search(params[:search][:query], params[:page]).order(admin: :desc, name: :asc).where(approved: false)
      if params[:search][:account_requested_after].present?
        account_requested_after_string = params[:search][:account_requested_after].to_s
        account_requested_after = DateTime.strptime(account_requested_after_string, '%m-%d-%Y %H:%M')
        @pending_users = @pending_users.where("created_at >= ?", account_requested_after)
      if params[:search][:account_requested_before].present?
          account_requested_before_string = params[:search][:account_requested_before].to_s
          account_requested_before = DateTime.strptime(account_requested_before_string, '%m-%d-%Y %H:%M')
          @pending_users = @pending_users.where("created_at <= ?", account_requested_before)
        end
      elsif params[:search][:account_requested_before].present?
        account_requested_before_string = params[:search][:account_requested_before].to_s
        account_requested_before = DateTime.strptime(account_requested_before_string, '%m-%d-%Y %H:%M')
        @pending_users = @pending_users.where("created_at <= ?", account_requested_before)
      end
    else
      @pending_users = User.paginate(page: params[:page]).order(admin: :desc, name: :asc).where(approved: false)
    end
  end

  def approve_account
    @user = User.find(params[:id])
    @approving_admin = current_user
    @user.approve_user_account
    @user.send_account_approved_email(@approving_admin)
    flash[:success] = "#{@user.name} has been approved. They have been notified via email."
    redirect_to pending_users_url
  end

  def deactivate_user
    @user = User.find(params[:id])
    @user.deactivate_user
    flash[:success] = "#{@user.name}'s account has been deactivated."
    redirect_to user_url(@user)
  end

  def reactivate_user
    @user = User.find(params[:id])
    @user.reactivate_user
    flash[:success] = "#{@user.name}'s account has been reactivated."
    redirect_to user_url(@user)
  end

  def promote_to_admin
    @user = User.find(params[:id])
    @user.change_to_admin
    flash[:success] = "#{@user.name} has been promoted to an admin."
    redirect_to user_url(@user)
  end

  def demote_to_user
    @user = User.find(params[:id])
    @user.change_to_user
    flash[:success] = "#{@user.name} has been demoted to a user."
    redirect_to user_url(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
