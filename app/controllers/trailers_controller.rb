class TrailersController < ApplicationController
  before_action :set_trailer, only: %i[show edit update destroy]

  def index
    @trailers = Trailer.all
  end

  def show
    @dose = Dose.new
  end

  def new
    @trailer = Trailer.new
  end

  def create
    @trailer = Trailer.new(trailer_params)
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

  def show_trailers
    @trailers = Trailer.where(user_id: current_user)
  end

  private

  def set_trailer
    @trailer = Trailer.find(params[:id])
  end

  def trailer_params
    params.require(:trailer).permit(:type, :price, :description, :coordinates, :onboard_capacity)
  end
end
