class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
    if @event.registrations.where(user_id: current_user.id).any?
      redirect_to @event, notice: 'Already registered'
    else
      @reg = Registration.new(user_id: current_user.id, event_id: @event.id)
      @reg.save
      redirect_to @event, notice: 'Successfully registered'
    end
  end

  def create
  end

end
