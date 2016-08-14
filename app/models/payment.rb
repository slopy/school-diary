class Payment < ActiveRecord::Base
  belongs_to :student
  belongs_to :payment_date

  validates :student, :payment_date, presence: true
  validates :payment_date, uniqueness: { scope: :student }
end
