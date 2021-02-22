class AddReferencesToReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :user, index: true
    add_reference :reservations, :trailer, index: true
  end
end
