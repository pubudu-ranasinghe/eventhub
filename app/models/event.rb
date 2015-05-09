class Event < ActiveRecord::Base
  has_attached_file :cover, :styles => { :hero => "960x300>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
end
