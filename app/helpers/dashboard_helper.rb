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
      return link_to 'Unpublish', unpublish_event_path(e), method: :post, class: 'btn btn-sm btn-warning'
    else
      return link_to 'Publish', publish_event_path(e), method: :post, class: 'btn btn-sm btn-primary'
    end
  end

end
