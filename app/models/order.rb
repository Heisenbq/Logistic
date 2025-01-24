class Order < ApplicationRecord
  validates :order_date, presence: true,  comparison: {greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today + 1, message: "cannot be in the future" }
  validates :delivery_address, presence: true, length: { maximum: 255 }
  validates :customer_name, presence: true, length: { maximum: 100 }
  validates :status, presence: false, inclusion: { in: %w[pending shipped delivered canceled], message: "must be 'pending', 'shipped', 'delivered', or 'canceled'" }

  def to_s_for_collapse_choice
    "#{order_date} #{delivery_address} #{customer_name}"
  end
end
