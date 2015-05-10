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

  belongs_to :user

  self.per_page = 3
end
