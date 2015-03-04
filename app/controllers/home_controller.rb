class HomeController < ApplicationController

  def slot
    @result=User.get_student_avatars.to_json    
  end

end
