module EventsHelper
  def format_time_field(time)
    time.strftime("%I:%M %p") unless time.blank?
  end

  def print_event_date
    s_date = @event.start_date.strftime("%b %d")
    e_date = @event.end_date.strftime("%b %d")
    s_time = @event.start_time.strftime("%I:%M%p")
    e_time = @event.end_time.strftime("%I:%M%p")

    if @event.start_date == @event.end_date
      content_tag(:h3, "#{s_date} from #{s_time} to #{e_time}")
    else
      content_tag(:h3, "#{s_date} - #{s_time} to #{e_date} - #{e_time}")
    end
  end
end
