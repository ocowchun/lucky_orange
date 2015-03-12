class HaveHomeworksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_homework
  before_action :check_exist_homework,:only=>[:new]
  authorize_resource

  def dashboard
    @have_homeworks=@homework.have_homeworks.where("score is NULL").page(params[:page]).per(10).order("have_homeworks.updated_at desc")
  end

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

  def score
    @have_homework=@homework.have_homeworks.find(params[:id])
    @have_homework.score=params[:score]
    if   @have_homework.save
      flash[:info]="評分成功"
    else
      flash[:alert]=@have_homework.errors.full_messages
    end
    redirect_to dashboard_homework_have_homeworks_path(@homework)
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
