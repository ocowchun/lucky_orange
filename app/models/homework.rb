class Homework < ActiveRecord::Base
  has_many :have_homeworks

  def complete_work_count
    have_homeworks_count
  end
end
