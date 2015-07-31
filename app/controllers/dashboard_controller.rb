class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorized_user, only: [:list]

  def index
  end

  def attending
    @events = current_user.events.live(Time.zone.now)
  end

  def created
    @events = current_user.created_events.order(created_at: :desc)
  end

  def list
    @event = Event.friendly.find(params[:id])
    @reg = Registration.where(event: @event).order(register_number: :asc)
  end

  private

    def authorized_user
      @event = Event.friendly.find(params[:id])
      if @event.creator_id != current_user.id
        if current_user.email == 'pubudu@eventhub.lk' || current_user.email == 'pavithra@eventhub.lk'
          return true
        end
        redirect_to root_path, notice: "Oops! You don't have permission to do that"
      end
    end

end
