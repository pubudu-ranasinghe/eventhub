class DashboardController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
  end

  def attending
    @events = current_user.events
  end

  def created
    @events = current_user.created_events
  end

end
