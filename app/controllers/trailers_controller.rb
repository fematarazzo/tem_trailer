class TrailersController < ApplicationController
  before_action :set_trailer, only: %i[show edit update destroy]
  # before_action :validate_current_user, only: %i[edit update destroy]
  def index
    @trailers = Trailer.all
    @markers = @trailers.geocoded.map do |flat|
    {
      lat: flat.latitude,
      lng: flat.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { trailer: @trailers })
    }
    end
  end

  def show
    @reservation = Reservation.new
  end

  def new
    @trailer = Trailer.new
  end

  def create
    @trailer = Trailer.new(trailer_params)
    @trailer.user = current_user
    if @trailer.save
      redirect_to trailer_path(@trailer)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @trailer.update(trailer_params)
    redirect_to trailer_path(@trailer)
  end

  def destroy
    @trailer.destroy
    redirect_to trailers_path
  end

  private

  def set_trailer
    @trailer = Trailer.find(params[:id])
  end

  def trailer_params
    params.require(:trailer).permit(:model, :price, :description, :address, :onboard_capacity, :photo)
  end

  # def validate_current_user
  #   if !current_user.admin? && @trailer.user != current_user
  #     redirect_to root_path, alert: 'Invalid action'
  #     return
  #   end
  # end
end
