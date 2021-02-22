class AddReferencesToReservation < ActiveRecord::Migration[6.1]
  def change
    add_reference :reservations, :user, null: false, foreign_key: true
    add_reference :reservations, :trailer, null: false, foreign_key: true
  end
end
