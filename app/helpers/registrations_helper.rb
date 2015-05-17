module RegistrationsHelper

  def registered_check(e)
    if e.registrations.where(user: current_user).any?
      content_tag(:h4, "Registered")
    else
      link_to 'Register', new_event_registration_path(@event), class: 'btn btn-primary'
    end
  end

end
