class Delivery < ApplicationRecord
  belongs_to :order
  belongs_to :vehicle
  belongs_to :driver
  validates :delivery_date, presence: true,  comparison: {greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today + 1, message: "cannot be in the future" }
  validates :status, presence: true, inclusion: { in: ['pending', 'shipped', 'delivered', 'canceled'], message: "%{value} is not a valid status" }
end
