class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    unless @reservation.save
      flash.now[:alert] = '申し訳ございません お電話にてお問い合わせください'
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:count, :lesson_id).marge(user_id: current_user.id)
  end
end
