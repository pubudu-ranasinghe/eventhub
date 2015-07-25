class UserMailer < BaseMandrillMailer
  def welcome(user_id)
    user = User.find(user_id)
    subject = "Welcome to EventHub"
    merge_vars = {
      "FNAME" => user.f_name.capitalize,
      # "USER_URL" => user_url(user),
    }
    body = mandrill_template("welcome", merge_vars)
    send_mail(user.email, subject, body)
  end

  def send_ticket(user_id, event_id)
    user = User.find(user_id)
    event = Event.find(event_id)

    s_date = event.start_date.strftime("%b %d")
    e_date = event.end_date.strftime("%b %d")
    s_time = event.start_time.strftime("%I:%M%p")
    e_time = event.end_time.strftime("%I:%M%p")
    if event.start_date == event.end_date
      f_datetime = " #{s_date} from #{s_time} to #{e_time}"
    else
      f_datetime = "#{s_date} - #{s_time} to #{e_date} - #{e_time}"
    end

    subject = "EventHub #{event.title}"
    merge_vars = {
      "ETITLE" => event.title,
      "ANAME" => "#{user.f_name.capitalize} #{user.l_name.capitalize}",
      "EDATETIME" => f_datetime,
      "EVENUE" => event.address,
      "ECOVERURL" => "http://eventhub.lk#{event.cover.url(:hero)}",
      "ELATLNG" => "#{event.latitude},#{event.longitude}",
      # need to change this probably
    }
    body = mandrill_template("ticket", merge_vars)
    send_mail(user.email, subject, body)
  end

end
