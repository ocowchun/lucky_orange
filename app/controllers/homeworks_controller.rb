class HomeworksController < ApplicationController
  before_action :find_homework,:only=>[:show,:edit,:update]
  authorize_resource

  def index
    @homeworks=Homework.all
  end

  def dashboard
    @homeworks=Homework.all
  end

  def show
    @have_homeworks=@homework.have_homeworks.includes(:user).page(params[:page]).per(10).order("have_homeworks.updated_at desc")
  end

  def new
    @homework=Homework.new
  end

  def create
    @homework=Homework.new(homework_params)
    if @homework.save
      redirect_to homeworks_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @homework.update(homework_params)
      redirect_to homeworks_path
    else
      render :edit
    end
  end


  private

  def homework_params
    params.require(:homework).permit(:name,:introduction,:deadline)
  end

  def find_homework
    @homework=Homework.find(params[:id])
  end
end
