class Event < ActiveRecord::Base
  TYPES = {
    0 => "Open",
    1 => "Free",
    2 => "Paid(Coming soon)"
  }

  # friendly id
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  has_attached_file :cover,
                    :styles => { :hero => "960x300#", :thumb => "300x200#" },
                    :convert_options => { :hero => "-strip", :thumb => "-quality 75 -strip" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :start_date, presence: true
  validates :start_time, presence: true
  validates :end_date, presence: true
  validates :end_time, presence: true
  validates :cover, presence: true
  validates :organizer_title, presence: true
  validates :organizer_tel, presence: true
  # event type validation

  validates_presence_of :etype
  validates :etype, inclusion: { in: %w(0 1 2), message: "%{value} is an invalid selection" }

  validates :no_of_registrations, presence: true, numericality: { greater_than_or_equal_to: 10, less_than: 1000}, if: :is_limited_event?

  after_validation :set_reg_no

  def set_reg_no
    self.no_of_registrations ||= -1
  end
  def is_limited_event?
    etype == 1
  end

  # belongs_to :user

  belongs_to :user
  has_many :registrations
  has_many :users, :through => :registrations

  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id

  # category
  belongs_to :category

  self.per_page = 6

  scope :live, ->(time) { where("start_date > ?", time) }
  scope :published, -> { where(published: true) }
  scope :not_approved, -> { where(approved: false) }
  scope :not_published, -> { where(published: false) }

  scope :user_registered, -> { where( registrations(user: current_user).any? )}

  # geocoding
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
