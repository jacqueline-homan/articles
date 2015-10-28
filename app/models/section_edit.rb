class SectionEdit < ActiveRecord::Base
  #belongs_to :admin_user we change this to :editor
  belongs_to :editor, :class_name => "AdminUser", :foreign_key => "admin_user_id"
  belongs_to :section
end
