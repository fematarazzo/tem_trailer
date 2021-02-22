class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type, :string
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
    add_column :users, :profile_image, :string
  end
end
