class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @have_homeworks=@user.have_homeworks.includes(:homework)
  end
end
