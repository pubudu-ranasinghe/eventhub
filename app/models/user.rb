class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # has_many :events

  has_many :registrations
  has_many :events, :through => :registrations

  has_many :created_events, :class_name => "Event", :foreign_key => :creator_id
end
