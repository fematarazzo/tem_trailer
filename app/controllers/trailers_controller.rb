class TrailersController < ApplicationController
  before_action :set_trailer, only: %i[show edit update destroy]
  # before_action :validate_current_user, only: %i[edit update destroy]
  def index
    if params[:search]
      unless params[:search][:start_date].blank? &&
             params[:search][:end_date].blank? &&
             params[:search][:query].blank? &&
             params[:search][:capacity].blank?
        @reservation = Reservation.new(start_date: params[:search][:start_date], end_date: params[:search][:end_date])
        if params[:search][:capacity].blank?
          @trailers = Trailer.where("address ILIKE ?", "%#{params[:search][:query]}%")
        else
          @trailers = Trailer.where("address ILIKE ?", "%#{params[:search][:query]}%")
                             .where(onboard_capacity: params[:search][:capacity])
          @trailers.select do |trailer|
            Reservation.where(trailer: trailer).where("start_date > ? OR end_date <  ?", params[:search][:end_date], params[:search][:start_date]).empty?
          end
        end
        @markers = @trailers.geocoded.map do |flat|
          {
            lat: flat.latitude,
            lng: flat.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { trailer: @trailers })
          }
        end
      else
        @trailers = Trailer.order(created_at: :desc)
        @markers = @trailers.geocoded.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { trailer: @trailers })
        }
        end
      end
    else
      @trailers = Trailer.order(created_at: :desc)
      @markers = @trailers.geocoded.map do |flat|
        {
          lat: flat.latitude,
          lng: flat.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { trailer: @trailers })
        }
      end
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
    params.require(:trailer).permit(:model, :price, :description, :address, :onboard_capacity, :photo, :start_date, :end_date)
  end

  # def validate_current_user
  #   if !current_user.admin? && @trailer.user != current_user
  #     redirect_to root_path, alert: 'Invalid action'
  #     return
  #   end
  # end
end
