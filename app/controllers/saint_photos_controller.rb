class SaintPhotosController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :admin_user,     only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @saint_photos = SaintPhoto.all
  end

  def show
    @saint_photo = SaintPhoto.find(params[:id])
  end

  def new
    @saint_photo = SaintPhoto.new
  end

  def edit
    @saint_photo = SaintPhoto.find(params[:id])
  end

  def create
    current_saint = Saint.find(params[:current_saint_id])
    # current_saint.timeline_events.create(timeline_event_params)
    current_saint.saint_photos.create(photo: params[:photo],
                                      photo_priority: params[:photo_priority],
                                      photo_caption: params[:photo_caption],
                                      photo_description: params[:photo_description],
                                      photo_alternative_text: params[:photo_alternative_text],
                                      width: params[:width],
                                      height: params[:height])
    redirect_to current_saint
  end

  def update
    @saint_photo = SaintPhoto.find(params[:id])
    respond_to do |format|
      if @saint_photo.update(saint_photo_params)
        format.html { redirect_to @saint_photo, notice: 'Saint photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @saint_photo }
      else
        format.html { render :edit }
        format.json { render json: @saint_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @saint_photo.destroy
    respond_to do |format|
      format.html { redirect_to saint_photos_url, notice: 'Saint photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def saint_photo_params
    params.require(:saint_photo).permit(:photo, :photo_priority, :photo_caption, :photo_description,
      :photo_alternative_text, :width, :height)
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
