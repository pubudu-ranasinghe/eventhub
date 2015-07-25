class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  after_create :send_welcome_email_to_user
  after_create :subscribe_user_to_mailing_list
  # has_many :events

  has_many :registrations
  has_many :events, :through => :registrations

  has_many :created_events, :class_name => "Event", :foreign_key => :creator_id

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.f_name = auth.info.first_name   # assuming the user model has a name
      user.l_name = auth.info.last_name   # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
 
  private

    def subscribe_user_to_mailing_list
      SubscribeUserToMailingListJob.perform_later(self)
    end

    def send_welcome_email_to_user
      UserMailer.welcome(self.id).deliver_later
    end
end
