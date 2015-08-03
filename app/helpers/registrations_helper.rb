module RegistrationsHelper

  def registration_check(e)

    if e.approved == false || e.published == false
      content_tag(:h4, "Registrations Unavailable", class: 'registered-notice')
    elsif e.etype != '1'
      # return empty
      if e.ticket_url.present?
        content_tag(:div) do
          concat link_to 'Buy Tickets Now!', e.ticket_url, class: 'btn btn-primary'
        end
      end
    else
      if e.registrations.where(user: current_user).any?
        content_tag(:h4, "You are registered", class: 'registered-notice')
      else
        if e.users.count < e.no_of_registrations
          content_tag(:div) do
            concat link_to 'Register for Free!', new_event_registration_path(@event), class: 'btn btn-primary'
            concat content_tag(:p, "Only " +(e.no_of_registrations-e.users.count).to_s+ " spots left", class: 'spots-left')
          end
        else
          content_tag(:h4, "Sold Out", class: 'registered-notice')
        end
      end
      # if e.users.count < e.no_of_registrations
      #   if e.registrations.where(user: current_user).any?
      #     content_tag(:h4, "You are registered", class: 'registered-notice')
      #   else
      #     content_tag(:div) do
      #       concat link_to 'Register for Free!', new_event_registration_path(@event), class: 'btn btn-primary'
      #       concat content_tag(:p, "Only " +(e.no_of_registrations-e.users.count).to_s+ " spots left", class: 'spots-left')
      #     end
      #   end
      # else
      #   # sold out
      #   content_tag(:h4, "Sold Out", class: 'registered-notice')
      # end
    end

  end

end
