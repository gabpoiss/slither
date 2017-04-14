class AddAddressToSnakes < ActiveRecord::Migration[5.0]
  def change
    add_column :snakes, :address, :string
  end
end
