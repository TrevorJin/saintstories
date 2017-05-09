class SaintsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :admin_user,     only: [:new, :create, :edit, :update, :destroy]

  def index
    @saints = Saint.all
  end

  def show
    @saint = Saint.friendly.find(params[:id])
    # Redirect to the latest slug.
    if request.path != saint_path(@saint)
      redirect_to @saint, status: :moved_permanently
  end
    @following_saints = @saint.following
    @follower_saints = @saint.followers
    @written_works = @saint.written_works.order(publication_date: :asc)
    @timeline_events = @saint.timeline_events.order(event_priority: :asc)
    @saint_photos = @saint.saint_photos.order(photo_priority: :asc)
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
    @popes = @saints.where(pope: true)
    @cardinals = @saints.where(cardinal: true)
    @bishops = @saints.where(bishop: true)
    @priests = @saints.where(priest: true)
    @religious = @saints.where(religious: true)
    @laypeople = @saints.where(lay: true)
    @martyrs = @saints.where(martyr: true)
    @founders = @saints.where(founder: true)
    @mystics = @saints.where(mystic: true)
    @royalty = @saints.where(royalty: true)
    @doctors_of_the_church = @saints.where(doctor_of_the_church: true)
    @early_church_fathers = @saints.where(early_church_father: true)

    @birth_hash = build_birth_markers(@saints)
    @death_hash = build_death_markers(@saints)
    @pope_birth_hash = build_birth_markers(@popes)
    @pope_death_hash = build_death_markers(@popes)
    @cardinal_birth_hash = build_birth_markers(@cardinals)
    @cardinal_death_hash = build_death_markers(@cardinals)
    @bishop_birth_hash = build_birth_markers(@bishops)
    @bishop_death_hash = build_death_markers(@bishops)
    @priest_birth_hash = build_birth_markers(@priests)
    @priest_death_hash = build_death_markers(@priests)
    @religious_birth_hash = build_birth_markers(@religious)
    @religious_death_hash = build_death_markers(@religious)
    @layperson_birth_hash = build_birth_markers(@laypeople)
    @layperson_death_hash = build_death_markers(@laypeople)
    @martyr_birth_hash = build_birth_markers(@martyrs)
    @martyr_death_hash = build_death_markers(@martyrs)
    @founder_birth_hash = build_birth_markers(@founders)
    @founder_death_hash = build_death_markers(@founders)
    @mystic_birth_hash = build_birth_markers(@mystics)
    @mystic_death_hash = build_death_markers(@mystics)
    @royalty_birth_hash = build_birth_markers(@royalty)
    @royalty_death_hash = build_death_markers(@royalty)
    @doctor_of_the_church_birth_hash = build_birth_markers(@doctors_of_the_church)
    @doctor_of_the_church_death_hash = build_death_markers(@doctors_of_the_church)
    @early_church_father_birth_hash = build_birth_markers(@early_church_fathers)
    @early_church_father_death_hash = build_death_markers(@early_church_fathers)

    gon.birth_hash = @birth_hash
    gon.death_hash = @death_hash
    gon.pope_birth_hash = @pope_birth_hash
    gon.pope_death_hash = @pope_death_hash
    gon.cardinal_birth_hash = @cardinal_birth_hash
    gon.cardinal_death_hash = @cardinal_death_hash
    gon.bishop_birth_hash = @bishop_birth_hash
    gon.bishop_death_hash = @bishop_death_hash
    gon.priest_birth_hash = @priest_birth_hash
    gon.priest_death_hash = @priest_death_hash
    gon.religious_birth_hash = @religious_birth_hash
    gon.religious_death_hash = @religious_death_hash
    gon.layperson_birth_hash = @layperson_birth_hash
    gon.layperson_death_hash = @layperson_death_hash
    gon.martyr_birth_hash = @martyr_birth_hash
    gon.martyr_death_hash = @martyr_death_hash
    gon.founder_birth_hash = @founder_birth_hash
    gon.founder_death_hash = @founder_death_hash
    gon.mystic_birth_hash = @mystic_birth_hash
    gon.mystic_death_hash = @mystic_death_hash
    gon.royalty_birth_hash = @royalty_birth_hash
    gon.royalty_death_hash = @royalty_death_hash
    gon.doctor_of_the_church_birth_hash = @doctor_of_the_church_birth_hash
    gon.doctor_of_the_church_death_hash = @doctor_of_the_church_death_hash
    gon.early_church_father_birth_hash = @early_church_father_birth_hash
    gon.early_church_father_death_hash = @early_church_father_death_hash
  end

  private

  def saint_params
    params.require(:saint).permit(:name, :gender, :feast_day,
      :birth_date, :birth_accuracy, :death_date, :death_accuracy,
      :birth_location, :death_location, :beatification_date,
      :canonization_date, :birth_latitude, :birth_longitude,
      :death_latitude, :death_longitude, :pope, :cardinal, :bishop,
      :priest, :religious, :lay, :martyr, :founder, :mystic, :royalty,
      :doctor_of_the_church, :early_church_father, :avatar,
      :avatar_caption, :avatar_description, :avatar_alternative_text,
      :beatification_accuracy, :canonization_accuracy,
      :short_description, :long_description, :canonization_status)
  end

  def build_birth_markers(saints)
    saints_birth_hash = Gmaps4rails.build_markers(saints) do |saint, marker|
      marker.lat saint.birth_latitude
      marker.lng saint.birth_longitude
      marker.infowindow render_to_string(:partial => "/saints/saint_infowindow", :locals => { :saint => saint })
      marker.title "#{saint.name}"
    end
    return saints_birth_hash
  end

  def build_death_markers(saints)
    saints_death_hash = Gmaps4rails.build_markers(saints) do |saint, marker|
      marker.lat saint.death_latitude
      marker.lng saint.death_longitude
      # marker.infowindow "<h4>#{saint.name}</h4><br><b>Born:</b> #{saint.birth_date.strftime("%B %d, %Y")} #{saint.birth_location}<br> <img src='http://www.totus2us.com/typo3temp/pics/feaf790989.jpg' style='width: 50%; height: 50%' />"
      marker.infowindow render_to_string(:partial => "/saints/saint_infowindow", :locals => { :saint => saint })
      marker.title "#{saint.name}"
    end
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
