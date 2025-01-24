class Delivery < ApplicationRecord
  belongs_to :order
  belongs_to :vehicle
  belongs_to :driver
  validates :delivery_date, presence: true,  comparison: {greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today + 1, message: "cannot be in the future" }
  validates :status, presence: true, inclusion: { in: ['pending', 'shipped', 'delivered', 'canceled'], message: "%{value} is not a valid status" }
  validate :delivery_date_after_order_date

  private

  # Кастомная валидация для проверки delivery_date
  def delivery_date_after_order_date
    if order.present? && delivery_date.present? && delivery_date < order.order_date
      errors.add(:delivery_date, "must be after the order date (#{order.order_date.strftime('%d %B %Y')}).")
    end
  end
end
