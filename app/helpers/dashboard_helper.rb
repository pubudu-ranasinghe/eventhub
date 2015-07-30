module DashboardHelper

  def published_status(e)
    if e.published == true
      return content_tag(:span, "Published", class: "label label-success")
    else
      return content_tag(:span, "Not published", class: "label label-default")
    end
  end

  def publish_button(e)
    if e.published == true
      return link_to 'Unpublish', unpublish_event_path(e), method: :post, class: 'btn btn-sm btn-default'
    else
      return link_to 'Publish', publish_event_path(e), method: :post, class: 'btn btn-sm btn-default'
    end
  end

  def print_registration_count(e)
    if e.etype == '1'
      return ('<div class="media-right">'+
              "<div class=\"progress progress-thin\"><div class=\"progress-bar progress-bar-red\" role=\"progressbar\" aria-valuenow=\"#{e.users.count}\" aria-valuemin=\"0\" aria-valuemax=\"#{e.no_of_registrations}\" style=\"width: #{e.users.count*100/e.no_of_registrations}%;\"></div></div>"+
             "<h4>#{e.users.count} of #{e.no_of_registrations}</h4>"+
             '<p>Registrations reserved</p></div>').html_safe

    end
  end

end
