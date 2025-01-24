class Driver < ApplicationRecord
  
    validates :first_name, presence: true, length: { maximum: 50, message: "less than 50 symbols" }
    validates :last_name, presence: true, length: { maximum: 50, message: "less than 50 symbols" }
    validates :license_number, presence: true, uniqueness: true, format: { with: /\A\d{10}\z/, message: "must only contain numbers and 10 digits" }
    validates :phone_number, presence: true, format: { with: /\A\+7\d{10}\z/, message: "should be a valid phone number (e.g., +7XXXXXXXXXX)" }
    validates :employment_date, presence: true, comparison: {greater_than_or_equal_to: 1900, less_than_or_equal_to: Date.today, message: "cannot be in the future" }

    def to_s_for_collapse_choice
      "#{first_name} #{last_name} #{phone_number}"
    end
end
