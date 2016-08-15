class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy
  has_many :subject_items, through: :participations
  
  has_many :payments, -> { joins(:payment_date).order('payment_dates.scheduled_at') }, 
                    dependent: :destroy
  has_many :payments_dates, through: :payments

  validates :first_name, :last_name, presence: true

  accepts_nested_attributes_for :subject_items

  after_create :create_payments

  private 

  def create_payments
    PaymentDate.all.each do |payment_date|
      payment_date.payments.create(student: self)
    end
  end
end
