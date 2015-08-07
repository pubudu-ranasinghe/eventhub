module EventsHelper
  def format_time_field(time)
    time.strftime("%I:%M %p") unless time.blank?
  end

  def print_event_date
    s_date = @event.start_date.strftime("%a, %b %d")
    e_date = @event.end_date.strftime("%a, %b %d")
    s_time = @event.start_time.strftime("%I:%M%p")
    e_time = @event.end_time.strftime("%I:%M%p")

    if @event.start_date == @event.end_date
      return " #{s_date} from #{s_time} to #{e_time}"
    else
      return "#{s_date} - #{s_time} to #{e_date} - #{e_time}"
    end
  end

  def print_tomo_label(start_date)
    if start_date.to_date == Date.tomorrow
      ("<span class=\"label label-main-red\">Tomorrow</span>").html_safe
    end
  end

  def print_ongoing_label(start_date)
    if start_date.to_date == Date.tomorrow
      ("<span class=\"label label-main-red\">Tomorrow</span>").html_safe
    end
  end


  def method_name

  end

  def print_attendee_count
    if @event.etype == '1'

      if @event.users.count == 0
        return ('<div class="event-extra-card"><p>'+
                '<i class="icon ion-android-people md-36"></i>'+
                'No one registered yet. Be the first to register!'+
                '</p></div>').html_safe
      else
        return ('<div class="event-extra-card"><p>'+
                '<i class="icon ion-android-people md-36"></i>'+
                "#{@event.users.count} people attending"+
                '</p></div>').html_safe
      end

    end
  end

  def print_ticket_details
    if @event.etype == '2' && !@event.ticket_details.empty?
      return ('<div class="event-extra event-extra-ticket">'+
              simple_format(@event.ticket_details)+
              '</div>').html_safe
    end
  end

  def print_fb_link
    if @event.fb_link.present?
      return ('<div class="event-extra-card"><p>'+
              '<a href="'+
              @event.fb_link+
              '"><i class="icon ion-social-facebook md-36"></i>'+
              'Facebook Event</a>'+
              '</p></div>').html_safe
    end
  end

  def print_organizer_desc
    if @event.organizer_desc.present?
      return ('<div class="event-desc">'+
              '<p>Organized by '+
              @event.organizer_title+
              '</p><p>'+
              simple_format(@event.organizer_desc)+
              '</p></div>').html_safe
    end
  end

  def print_organizer_tel
    if @event.telephone_visible
      return ('<div class="event-extra-card"><p>'+
              '<i class="icon ion-android-call md-36"></i>'+
              'Contact organizer '+
              @event.organizer_tel+
              '</p></div>').html_safe
    end
  end
end
