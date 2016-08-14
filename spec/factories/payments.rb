FactoryGirl.define do
  factory :payment do
    student { FactoryGirl.create :student_without_create_payments }
    payment_date { FactoryGirl.create :payment_date_without_create_students }
    paid_at { nil }
  end
end
