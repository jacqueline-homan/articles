class Page < ActiveRecord::Base
  #scope :recent, lambda {where(:created_at => 1.week.ago..Time.now)}
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
end
