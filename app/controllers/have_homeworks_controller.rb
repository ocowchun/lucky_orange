class HaveHomeworksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_homework
  before_action :check_exist_homework,:only=>[:new]

  def new
    @have_homework=current_user.have_homeworks.new
  end

  def create
    @have_homework=current_user.have_homeworks.new(have_homework_params)
    @have_homework.homework_id=@homework.id
    if @have_homework.save
      redirect_to homework_path(@homework)
    else
      render :new
    end
  end

  def edit
    @have_homework=current_user.have_homeworks.where(homework_id:@homework.id).first
  end

  def update
    @have_homework=current_user.have_homeworks.where(homework_id:@homework.id).first
    if @have_homework.update(have_homework_params)
      redirect_to homework_path(@homework)
    else
      render :new
    end
  end

  private

  def find_homework
    @homework=Homework.find(params[:homework_id])
  end

  def check_exist_homework
    if current_user.write_homework?(@homework)
      @have_homework=current_user.have_homeworks.where(homework_id:@homework.id).first
      redirect_to edit_homework_have_homework_path(@homework,@have_homework)
    end

  end

  def have_homework_params
    params.require(:have_homework).permit(:repo_url)
  end
end
