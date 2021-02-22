class CreateTrailers < ActiveRecord::Migration[6.1]
  def change
    create_table :trailers do |t|
      t.integer :price
      t.string :type
      t.text :description
      t.string :coordinates
      t.integer :onboard_capacity

      t.timestamps
    end
  end
end
