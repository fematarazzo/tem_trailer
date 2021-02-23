class UserTrailersController < ApplicationController
  def index
    @trailers = Trailer.where(user: current_user)
  end

  def show
    @trailer = Trailer.find(params[:id])
    @reservations = @trailer.reservations
  end
end
