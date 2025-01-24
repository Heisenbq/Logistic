class CreateVehicles < ActiveRecord::Migration[8.0]
  def change
    create_table :vehicles, id: :serial do |t|
      t.string :registration_number
      t.string :model
      t.integer :year
      t.integer :capacity
      t.string :location

      t.timestamps
    end
    
    add_index :vehicles, :registration_number, unique: true
  end
end
