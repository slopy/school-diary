require 'spec_helper'

feature 'User visits payments report page' do
  let!(:payment_date) { create :payment_date }                              
  let!(:student) { create :student, first_name: 'Jan',
                                    last_name: 'Nowak',
                                    birthdate: Date.new(1992,01,02) }

  scenario do 
    user = build(:user)
    sign_up_with user.email, user.password
    expect(page).to have_content 'Logout'

    visit report_payments_path
    expect(page).to have_content 'payments'
  end

end

feature 'User visits payments subjects page' do
  let!(:subject_item) { create :subject_item }                              
  let!(:student) { create :student, first_name: 'Jan',
                                    last_name: 'Nowak',
                                    birthdate: Date.new(1992,01,02) }
  let!(:participation) { create :participation, student: student,
                                                subject_item: subject_item }
  scenario do 
    user = build(:user)
    sign_up_with user.email, user.password
    expect(page).to have_content 'Logout'

    visit report_subjects_path
    expect(page).to have_content 'list of subjects'
  end
  
end