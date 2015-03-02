class Homework < ActiveRecord::Base
  has_many :have_homeworks, :class_name => "have_homework", :foreign_key => "homework_id"

  def complete_work_count
    have_homeworks_count
  end
end
