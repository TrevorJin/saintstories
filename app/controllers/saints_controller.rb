class SaintsController < ApplicationController
  # before_action :logged_in_user, only: [:new, :create, :edit, :update]

  def index
  	@saints = Saint.all
  end

  def show
  	@saint = Saint.find(params[:id])
  end

  def new
  	@saint = Saint.new
  end

  def create
    @saint = Saint.new(saint_params)
    if @saint.save
      flash[:info] = "Saint has been successfully created."
      redirect_to saints_url
    else
      render 'new'
    end
  end

  def edit
  	@saint = Saint.find(params[:id])
  end

  def update
    @saint = Saint.find(params[:id])
    if @saint.update_attributes(saint_params)
      flash[:success] = "Saint updated"
      redirect_to @saint
    else
      render 'edit'
    end
  end

  def destroy
    Saint.find(params[:id]).destroy
    flash[:success] = "Saint deleted"
    redirect_to saints_url
  end

  def map
  	@saints = Saint.all
  	@geojson = Array.new
  	@saints.each do |saint|
      @geojson << {
        type: 'Feature',
        geometry: {
          type: 'Point',
          coordinates: [saint.birth_longitude, saint.birth_latitude]
        },
        properties: {
          name: saint.name,
          :'marker-color' => '#00607d',
          :'marker-symbol' => 'circle',
          :'marker-size' => 'medium'
        }
      }
		end
		respond_to do |format|
  		format.html
  		format.json { render json: @geojson }  # respond with the created JSON object
		end
  end

  private

  	def saint_params
      params.require(:saint).permit(:name, :gender, :feast_day, :birth_date, :birth_accuracy, :death_date,
                                  	:death_accuracy, :birth_location, :death_location, :beatification_date,
                                  	:canonization_date, :birth_latitude, :birth_longitude, :death_latitude,
                                  	:death_longitude, :pope, :cardinal, :bishop, :priest, :religious, :lay,
                                  	:martyr, :founder, :mystic, :doctor_of_the_church, :early_church_father)
    end

    # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless user_logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
