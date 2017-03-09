class TimelineEventsController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  before_action :admin_user,     only: [:index, :show, :new, :create, :edit, :update, :destroy]

  def index
    @timeline_events = TimelineEvent.all
  end

  def show
    @timeline_event = TimelineEvent.find(params[:id])
  end

  def new
    @timeline_event = TimelineEvent.new
  end

  def edit
    @timeline_event = TimelineEvent.find(params[:id])
  end

  def create
    current_saint = Saint.find(params[:current_saint_id])
    # current_saint.timeline_events.create(timeline_event_params)
    current_saint.timeline_events.create(event_priority: params[:event_priority],
                                         event_title: params[:event_title],
                                         event_time: params[:event_time],
                                         event_description: params[:event_description],
                                         image: params[:image],
                                         image_caption: params[:image_caption],
                                         image_description: params[:image_description],
                                         image_alternative_text: params[:image_alternative_text])
    redirect_to current_saint
  end

  def update
    @timeline_event = TimelineEvent.find(params[:id])
    respond_to do |format|
      if @timeline_event.update(timeline_event_params)
        format.html { redirect_to @timeline_event, notice: 'Timeline event was successfully updated.' }
        format.json { render :show, status: :ok, location: @timeline_event }
      else
        format.html { render :edit }
        format.json { render json: @timeline_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @timeline_event.destroy
    respond_to do |format|
      format.html { redirect_to timeline_events_url, notice: 'Timeline event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def timeline_event_params
    params.require(:timeline_event).permit(:image, :image_caption, :image_description,
      :image_alternative_text, :event_description, :event_priority, :event_title,
      :event_time)
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
