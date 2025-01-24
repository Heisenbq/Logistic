class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders, id: :serial do |t|
      t.datetime :order_date, default: -> { 'CURRENT_TIMESTAMP' }
      t.string :delivery_address
      t.string :customer_name
      t.string :status, default: 'Pending'

      t.timestamps
    end

  end
end
