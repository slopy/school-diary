FactoryGirl.define do
  factory :payment_date do
    scheduled_at { Faker::Date.between(1.year.ago, 1.year.from_now) }

    factory :payment_date_without_create_students do
      after(:create) do |payment_date| 
        payment_date.class.skip_callback(:create, :after, :create_students)
      end
      after(:build) do |payment_date| 
        payment_date.class.skip_callback(:create, :after, :create_students)
      end
    end
    
  end
end
