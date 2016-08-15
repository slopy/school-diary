FactoryGirl.define do
  factory :student do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthdate do 
      date_from = 19.years.ago
      date_to = 25.years.ago
      date = Faker::Date.between(date_from, date_to)
      [true, false].sample ? nil : date
    end

    factory :student_without_create_payments do
      after(:create) do |student|
        student.class.skip_callback(:create, :after, :create_payments) 
      end
    end

  end
end
