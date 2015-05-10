module EventsHelper
  def format_time_field(time)
    time.strftime("%I:%M %p") unless time.blank?
  end
end
