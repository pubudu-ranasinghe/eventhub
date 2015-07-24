class RegistrationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event = Event.friendly.find(params[:event_id])
    @reg = @event.registrations.new
    # if @event.registrations.where(user: current_user).any?
    #   redirect_to @event, notice: 'Already registered'
    # else
    #   @event.registrations.create(user: current_user)
    #   redirect_to @event, notice: 'Successfully registered'
    # end
  end

  def create
      # refer event controller
      @event.decrement!(:no_of_registrations, 1)
      redirect_to @event, notice: 'sdsbs'
  end

end
