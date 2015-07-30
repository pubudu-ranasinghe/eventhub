module RegistrationsHelper

  def registration_check(e)
    # pending approval
    # unpublished
    # published
    #   registered
    #   not registered
    #     available
    #     soldout

    # if e.published
    #   if
    # else
    #
    # end

    if e.approved == false
      content_tag(:h4, "Registrations Unavailable", class: 'registered-notice')
    elsif e.published == true
      if e.no_of_registrations <= 0
        # return nothing
      elsif e.registrations.where(user: current_user).any?
        content_tag(:h4, "You are registered", class: 'registered-notice')
      else
        if e.users.count >= 0
          content_tag(:div) do
            concat link_to 'Register for Free!', new_event_registration_path(@event), class: 'btn btn-primary'
            concat content_tag(:p, "Only " +(e.no_of_registrations-e.users.count).to_s+ " spots left", class: 'spots-left')
          end
        else
          content_tag(:h4, "Sold Out", class: 'registered-notice')
        end
      end
    else
      content_tag(:h4, "Registrations Unavailable", class: 'registered-notice')
    end

  end

end
