class UserMailer < BaseMandrillMailer
  def welcome(user_id)
    user = User.find(user_id)
    subject = "Welcome to EventHub"
    merge_vars = {
      "FNAME" => user.f_name,
      # "USER_URL" => user_url(user),
    }
    body = mandrill_template("welcome", merge_vars)

    send_mail(user.email, subject, body)
  end
end
