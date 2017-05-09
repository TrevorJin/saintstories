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
    redirect_to current_saint
  end

  def update
    @relationship = Relationship.find(params[:id])
    respond_to do |format|
      if @relationship.update(relationship_params)
        format.html { redirect_to @relationship, notice: 'Relationship was successfully updated.' }
        format.json { render :show, status: :ok, location: @relationship }
      else
        format.html { render :edit }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    followed_saint = Relationship.find(params[:id]).followed
    follower_saint = Saint.find(params[:current_saint_id])
    follower_saint.unfollow(followed_saint)
    redirect_to follower_saint
  end

  private

  def relationship_params
    params.require(:relationship).permit(:follower_id, :followed_id, :status)
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

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
