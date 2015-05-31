class Event < ActiveRecord::Base
  has_attached_file :cover, :styles => { :hero => "960x300#", :thumb => "300x300#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :end_date, presence: true
  validates :end_time, presence: true
  validates :cover, presence: true

  # belongs_to :user

  belongs_to :user
  has_many :registrations
  has_many :users, :through => :registrations

  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id

  self.per_page = 6
end
