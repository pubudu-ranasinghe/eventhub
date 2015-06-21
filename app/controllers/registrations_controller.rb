class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.find(params[:event_id])
    @reg = @event.registrations.new
    # if @event.registrations.where(user: current_user).any?
    #   redirect_to @event, notice: 'Already registered'
    # else
    #   @event.registrations.create(user: current_user)
    #   redirect_to @event, notice: 'Successfully registered'
    # end
  end

  def create
      redirect_to @event, notice: 'sdsbs'
  end

end
