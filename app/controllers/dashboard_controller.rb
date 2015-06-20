class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def attending
    @events = current_user.events.live(Time.zone.now)
  end

  def created
    @events = current_user.created_events.order(created_at: :desc)
  end

end
