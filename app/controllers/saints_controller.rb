class SaintsController < ApplicationController
  # before_action :logged_in_user, only: [:new, :create, :edit, :update]
  

  def index
    @saints = Saint.all
  end

  def show
    @saint = Saint.friendly.find(params[:id])
    # Redirect to the latest slug.
    if request.path != saint_path(@saint)
      redirect_to @saint, status: :moved_permanently
    end
  end

  def new
    @saint = Saint.new
  end

  def create
    @saint = Saint.new(saint_params)
    if @saint.save
      flash[:info] = 'Saint has been successfully created.'
      redirect_to saints_url
    else
      render 'new'
    end
  end

  def edit
    @saint = Saint.friendly.find(params[:id])
  end

  def update
    @saint = Saint.friendly.find(params[:id])
    if @saint.update_attributes(saint_params)
      flash[:success] = 'Saint updated'
      redirect_to @saint
    else
      render 'edit'
    end
  end

  def destroy
    Saint.find(params[:id]).destroy
    flash[:success] = 'Saint deleted'
    redirect_to saints_url
  end

  def map
    @saints = Saint.all
    @hash = Gmaps4rails.build_markers(@saints) do |saint, marker|
      marker.lat saint.birth_latitude
      marker.lng saint.birth_longitude
      # marker.infowindow "<h4>#{saint.name}</h4><br><b>Born:</b> #{saint.birth_date.strftime("%B %d, %Y")} #{saint.birth_location}<br> <img src='http://www.totus2us.com/typo3temp/pics/feaf790989.jpg' style='width: 50%; height: 50%' />"
      marker.infowindow render_to_string(:partial => "/saints/saint_infowindow", :locals => { :saint => saint })
      marker.title "#{saint.name}"
    end
  end

  private

  def saint_params
    params.require(:saint).permit(:name, :gender, :feast_day,
      :birth_date, :birth_accuracy, :death_date, :death_accuracy,
      :birth_location, :death_location, :beatification_date,
      :canonization_date, :birth_latitude, :birth_longitude,
      :death_latitude, :death_longitude, :pope, :cardinal, :bishop,
      :priest, :religious, :lay, :martyr, :founder, :mystic,
      :doctor_of_the_church, :early_church_father, :image_url)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    return unless user_logged_in?
    store_location
    flash[:danger] = 'Please log in.'
    redirect_to login_url
  end
end
