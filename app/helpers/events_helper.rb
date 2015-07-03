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
      return " #{s_date} from #{s_time} to #{e_time}"
    else
      return "#{s_date} - #{s_time} to #{e_date} - #{e_time}"
    end
  end

  def print_attendee_count
    if @event.etype == '0'

    elsif @event.users.count == 0
      return ('<div class="event-extra-card"><p>'+
              '<i class="fa fa-user fa-fw fa-2x pull-left"></i>'+
              'No one registered yet. Be the first to register!'+
              '</p></div>').html_safe
    else
      return ('<div class="event-extra-card"><p>'+
              '<i class="fa fa-user fa-fw fa-2x pull-left"></i>'+
              "#{@event.users.count} people attending"+
              '</p></div>').html_safe
    end
  end
end
