class Event < ActiveRecord::Base
  has_attached_file :cover,
                    :styles => { :hero => "960x300#", :thumb => "300x200#" },
                    :convert_options => { :hero => "-strip", :thumb => "-quality 75 -strip" }, :default_url => "/images/:style/missing.png"
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

  # category
  belongs_to :category

  self.per_page = 6

  scope :live, ->(time) { where("start_date > ?", time) }
  scope :published, -> { where(published: true) }
  scope :not_approved, -> { where(approved: false) }
  scope :not_published, -> { where(published: false) }

  # geocoding
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

end
