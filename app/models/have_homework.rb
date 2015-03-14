class HaveHomework < ActiveRecord::Base
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :homework, :class_name => "Homework", :foreign_key => "homework_id", :counter_cache => true


  def score_text
    if score==4
      'A+'
    elsif score==3
      'A'
    elsif score==2
      'A-'
    else
      '遲交或未達基本標準'
    end
  end
  
end
