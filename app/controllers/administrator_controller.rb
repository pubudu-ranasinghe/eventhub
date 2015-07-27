class AdministratorController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admins

  def pending
    @events = Event.not_approved.order(start_date: :desc)
    @unpublished_e = Event.not_published.order(start_date: :desc)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_event
    #   @event = Event.find(params[:id])
    # end

    # check authorized user for edits update delete
    def authorize_admins

      if current_user.email != 'pubudu@eventhub.lk' && current_user.email != 'pavithra@eventhub.lk'
        redirect_to root_path, notice: "Oops! You don't have permission to do that"
      end
    end
end
