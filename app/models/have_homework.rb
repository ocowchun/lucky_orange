class HaveHomework < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :homework, :class_name => "Homework", :foreign_key => "homework_id", :counter_cache => true
end
