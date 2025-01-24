class CreateDeliveries < ActiveRecord::Migration[8.0]
  def change
    create_table :deliveries, id: :serial do |t|
      t.references :order, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.references :driver, null: false, foreign_key: true
      t.datetime :delivery_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :status, default: 'Pending'

      t.timestamps
    end
  end
end
