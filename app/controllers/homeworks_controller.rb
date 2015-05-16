class HomeworksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_homework,:only=>[:show,:edit,:update,:chart]
  authorize_resource

  def index
    @homeworks=Homework.all.order("id desc")
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

  def chart
    scores=@homework.have_homeworks.select('score,count(id) as amount').group('score')
    @result=[0,0,0,0]
    scores.each do|score|
      @result[score["score"]-4]=score["amount"] if score["score"].present?
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
