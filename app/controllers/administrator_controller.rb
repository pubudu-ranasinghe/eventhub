class AdministratorController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admins

  def pending
    @events = Event.not_approved.order(start_date: :asc)
    @unpublished_e = Event.not_published.order(start_date: :asc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_event
    #   @event = Event.find(params[:id])
    # end

    # check authorized user for edits update delete
    def authorize_admins

      if current_user.id != 1
        redirect_to root_path, notice: "Oops! You don't have permission to do that"
      end
    end
end
