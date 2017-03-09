class WrittenWorksController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_user,     only: [:create, :destroy]

  def index
    @written_works = WrittenWork.all
  end

  def show
    @written_work = WrittenWork.find(params[:id])
  end

  def new
    @written_work = WrittenWork.new
  end

  def edit
    @written_work = WrittenWork.find(params[:id])
  end

	def create
    current_saint = Saint.find(params[:current_saint_id])
    current_saint.written_works.create(title: params[:title], publication_date: params[:publication_date],
    																	 publication_accuracy: params[:publication_accuracy],
    																	 description: params[:description])
    redirect_to current_saint
  end

  def update
    @written_work = WrittenWork.find(params[:id])
    respond_to do |format|
      if @written_work.update(written_work_params)
        format.html { redirect_to @written_work, notice: 'Written work was successfully updated.' }
        format.json { render :show, status: :ok, location: @written_work }
      else
        format.html { render :edit }
        format.json { render json: @written_work.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	WrittenWork.find(params[:id]).destroy
    flash[:success] = "Written work deleted"
    redirect_to saints_url
  end

  private

  def written_work_params
    params.require(:written_work).permit(:title, :publication_date, :description,
      :publication_accuracy)
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
