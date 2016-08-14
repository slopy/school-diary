require 'spec_helper'

feature 'User checks student details' do
  let!(:student) { create :student, first_name: 'Jan',
                                    last_name: 'Nowak',
                                    birthdate: Date.new(1992,01,02) }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    find(:xpath, "//a[@title='show']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students » Jan Nowak'
    end
  end

  scenario do
    expect(page).to have_content '1992-01_02'
  end
end
