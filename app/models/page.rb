class Page < ActiveRecord::Base
  #scope :recent, lambda {where(:created_at => 1.week.ago..Time.now)}
  belongs_to :subject
  has_many :sections
  has_and_belongs_to_many :editors, :class_name => "AdminUser"

  scope :visible, lambda { where(:visible => true)}
  scope :invisible, lambda { where(:visible => false)}
  scope :sorted, lambda {order("pages.position ASC")} #table disambiguation used here
  scope :newest_first, lambda {order ("pages.created_at DESC")}
end
