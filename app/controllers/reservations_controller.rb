class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @trailer = Trailer.find(params[:trailer_id])
    @user = User.find(params[:user_id])
    @reservation.trailer = @trailer
    @reservation.user = @user
    if @reservation.save
      redirect_to reservation_path(@reservation)
    else
      render "trailers/show"
    end
  end

  def edit

  end

  def update
    @reservation.update(reservation_params)
    redirect_to reservation_path(@reservation)
  end

  def destroy
    @reservation = reservation.find(params[:id])
    @user = @reservation.user
    @reservation.destroy
    redirect_to user_path(@reservation.user)
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total, :rating, :description)
  end
end
