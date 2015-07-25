class SubscribeUserToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    # Do something later
    gb = Gibbon::API.new
    # gb.lists.subscribe({:id => 82e4bc8f5a, :email => {:email => user.email}, :double_optin => false})
    gb.lists.subscribe({:id => ENV["MAILCHIMP_LIST_ID"], :email => {:email => user.email}, :merge_vars => {:FNAME => user.f_name, :LNAME => user.l_name}, :double_optin => false})
  end
end
