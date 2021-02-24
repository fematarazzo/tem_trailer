class AddCoordinatesToTrailers < ActiveRecord::Migration[6.1]
  def change
    add_column :trailers, :latitude, :float
    add_column :trailers, :longitude, :float
  end
end
