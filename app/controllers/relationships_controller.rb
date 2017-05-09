class RelationshipsController < ApplicationController
	before_action :logged_in_user, only: [:index, :new, :create, :edit, :update, :destroy]
  before_action :admin_user,     only: [:index, :new, :create, :edit, :update, :destroy]

  def index
    @relationships = Relationship.all
  end

  def show
    @relationship = Relationship.find(params[:id])
  end

  def edit
    @relationship = Relationship.find(params[:id])
  end

  def create
    other_saint = Saint.find(params[:followed_id])
    current_saint = Saint.find(params[:current_saint_id])
    current_saint.follow(other_saint)
    redirect_to other_saint
  end

  def update
    @relationship = Relationship.where(follower_id: params[:follower_id], followed_id: params[:followed_id])
  end

  def destroy
    followed_saint = Relationship.find(params[:id]).followed
    follower_saint = Saint.find(params[:current_saint_id])
    follower_saint.unfollow(followed_saint)
    redirect_to follower_saint
  end

  private

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
