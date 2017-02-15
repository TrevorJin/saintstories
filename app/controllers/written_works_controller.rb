class WrittenWorksController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_user,     only: [:create, :destroy]

	def create
    current_saint = Saint.find(params[:current_saint_id])
    current_saint.written_works.create(title: params[:title], publication_date: params[:publication_date],
    																	 publication_accuracy: params[:publication_accuracy],
    																	 description: params[:description])
    redirect_to current_saint
  end

  def destroy
  	WrittenWork.find(params[:id]).destroy
    flash[:success] = "Written work deleted"
    redirect_to saints_url
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
