class ProfilesController < ApplicationController
  def show
    @reservations_client = Reservation.where(user_id: current_user.id)
    @reservations_owner = Reservation.where(trailer_id: current_user.trailers.ids)
  end
end
