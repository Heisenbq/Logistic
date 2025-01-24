class Vehicle < ApplicationRecord
  has_many :deliveries, dependent: :destroy

  validates :registration_number, presence: true, uniqueness: true, format: {
    with: /\A[АВЕКМНОРСТУХ]\d{3}[АВЕКМНОРСТУХ]{2}\d{2,3}\z/,
    message: "must be in the format of Russian vehicle registration numbers (e.g., А111АА123)"
  }
  validates :model, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1980, less_than_or_equal_to: Date.today.year, message: "must be greater or egual then 1980 and less then nowadays"}
  validates :capacity, numericality: { greater_than_or_equal_to: 0, message: "must be greater or egual then 0" }, presence:true

  def to_s_for_collapse_choice
    "#{registration_number} #{model}"
  end
end
