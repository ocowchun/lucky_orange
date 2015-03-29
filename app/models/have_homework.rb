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
    elsif score==1
      '遲交或未達基本標準'
    else
      '尚未評分'
    end
  end

end
