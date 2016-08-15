class PaymentDate < ActiveRecord::Base
  has_many :payments

  validates :scheduled_at, uniqueness: true, presence: true

  after_create :create_students

  private 

  def create_students
    Student.all.each do |student|
      student.payments.create(payment_date: self)
    end
  end
end
