class Homework < ActiveRecord::Base
  has_many :have_homeworks, :class_name => "have_homework", :foreign_key => "homework_id"
end
