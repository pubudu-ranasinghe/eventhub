module AdministratorHelper

  def approval_status(e)
    if e.approved == false
      return content_tag(:span, "Pending Approval", class: "label label-warning")
    end
  end

  def approval_button(e)
    if e.approved == false
      return link_to 'Approve', approve_event_path(e), method: :post, class: 'btn btn-sm btn-success'
    end
  end

end
