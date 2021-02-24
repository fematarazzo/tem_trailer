class AddToTrailer < ActiveRecord::Migration[6.1]
  def change
    add_column :trailers, :address, :string
    remove_column :trailers, :coordinates
    remove_column :users, :type
  end
end
