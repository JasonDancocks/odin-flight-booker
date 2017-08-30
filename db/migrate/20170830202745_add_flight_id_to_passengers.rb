class AddFlightIdToPassengers < ActiveRecord::Migration[5.1]
  def change
    add_column :passengers, :flight_id, :integer
  end
end
