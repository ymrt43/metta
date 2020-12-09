class ReservationsController < ApplicationController
  before_action :set_lesson

  def new
    @reservation = Reservation.new
    @lesson_duration = @lesson.lesson_duration
    @lesson_id = params[:lesson_id]
    @participants = @reservation.number_of_participants(@lesson_id)
    @capacity = @lesson.capacity - @participants
  end

  def create
    @reservation = @lesson.reservations.create(reservation_params)
    if @reservation.save
      lesson_id = params[:lesson_id]
      @participants = @reservation.number_of_participants(lesson_id)
      @capacity = @lesson.capacity - @participants
      if @capacity <= 0
        @lesson.update_fully_booked
      end
    else
      flash.now[:alert] = '申し訳ございません 再度送信いただくか、お電話にてお問い合わせください'
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:count).merge(user_id: current_user.id)
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end
