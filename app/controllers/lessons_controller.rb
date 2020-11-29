class LessonsController < ApplicationController
  before_action :set_lesson, only: [:edit, :update, :show, :destroy]

  def index
    @lessons = Lesson.all
  end

  def new
    @lesson = Lesson.new
    @courses = Course.all
  end
  
  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to lessons_path, notice: 'レッスン予定を公開しました'
    else
      flash.now[:alert] = 'レッスン予定の公開に失敗しました'
      render :new
    end
  end
  
  def edit
    @courses = Course.all
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to lessons_path, notice: 'レッスン予定を変更しました'
    else
      flash.now[:alert] = 'レッスン更新に失敗しました'
      render :edit
    end
  end

  def destroy
    if @lesson.destroy
      redirect_to lessons_path, notice: 'レッスン予定を削除しました'
    else
      flash.now[:alert] = '削除に失敗しました'
      render :index
    end
  end

  def show
    @lesson_duration = @lesson.lesson_duration
  end

  def home
    @courses = Course.all
    @lessons = Lesson.includes(:course).order("date ASC")
  end

  def adminuser
  end

  def search
    @lessons = Lesson.search(params[:course_id])
  end

  private

  def lesson_params
    params.require(:lesson).permit(:level, :capacity, :date, :start_time, :end_time, :fee, :lesson_introduction, :course_id, :fully_booked) 
  end

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

end
