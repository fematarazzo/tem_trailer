class AddReviewsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :rating, :integer
    add_column :reservations, :description, :text
  end
end
