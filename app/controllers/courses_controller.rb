class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: 'コースを追加しました'
    else
      flash.now[:alert] = 'コース追加に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: 'コースを更新しました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    if @course.destroy
      redirect_to courses_path, notice: 'コースを削除しました'
    else
      flash.now[:alert] = '削除に失敗しました'
      render :index
    end
  end

  private

  def course_params
    params.require(:course).permit(:course_name, :introduction, :src)
  end

  def set_course
    @course = Course.find(params[:id])
  end
end
