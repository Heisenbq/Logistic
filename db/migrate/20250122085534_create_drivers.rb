class CreateDrivers < ActiveRecord::Migration[8.0]
  def change
    create_table :drivers, id: :serial do |t|
      t.string :first_name
      t.string :last_name
      t.string :license_number, null: false
      t.string :phone_number
      t.date :employment_date

      t.timestamps
    end

    add_index :drivers, :license_number, unique: true 
  end
end
