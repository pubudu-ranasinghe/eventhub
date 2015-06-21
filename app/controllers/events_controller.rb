class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorized_user, only: [:edit, :update, :destroy, :publish, :unpublish]

  # GET /events
  # GET /events.json
  def index
    @events = Event.paginate(:page => params[:page]).live(Time.zone.now).published.order(start_date: :asc)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.created_events.new(event_params)
    @event.published = false
    @event.approved = false

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    if @event.cover.exists?
      @event.cover = nil
      @event.save
    end
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def publish
    @event = Event.find(params[:id])
    if @event.published == false && @event.approved == true
      @event.update(published: true)
      redirect_to @event, notice: 'Event was successfully published.'
    else
      redirect_to root_path, notice: 'Invalid action'
    end
  end

  def unpublish
    @event = Event.find(params[:id])
    if @event.published == true
      @event.update(published: false)
      redirect_to @event, notice: 'Event was successfully unpublished.'
    end
  end

  def approve
    @event = Event.find(params[:id])
    if @event.approved == false
      @event.update(approved: true)
      redirect_to @event, notice: 'Event approved.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_event
    #   @event = Event.find(params[:id])
    # end

    # check authorized user for edits update delete
    def authorized_user
      @event = Event.find(params[:id])
      if @event.creator_id != current_user.id
        if current_user.id == 1
          return true
        end
        redirect_to root_path, notice: "Oops! You don't have permission to do that"
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title,
                                    :description,
                                    :cover,
                                    :start_date,
                                    :start_time,
                                    :end_date,
                                    :end_time,
                                    :address )
    end
end
