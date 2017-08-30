class RenameColumns < ActiveRecord::Migration[5.1]
  def change
  	rename_column :flights, :start_id, :origin_airport_id
  	rename_column :flights, :finish_id, :destination_airport_id
  end
end
