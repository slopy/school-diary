require 'spec_helper'

feature 'User creates student' do
  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    click_on 'Add new one'
  end

  scenario 'with valid input' do
    fill_in 'First name', with: 'Adrian'
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content 'Student has been created!'
  end

  scenario 'with missing first name' do
    fill_in 'Last name', with: 'Nowacki'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end

  scenario 'with missing Last name' do
    fill_in 'First name', with: 'Adrian'
    click_button 'Create Student'
    expect(page).to have_content "can't be blank"
  end
end

feature 'User creates student student birthdate' do

  scenario 'with birthdate datepicker', js: true do
    user = build(:user)
    sign_up_with user.email, user.password

    expect(page).to have_content('Logout')

    visit students_path
    click_on 'Add new one'

    fill_in 'First name', with: 'Luk'
    fill_in 'Last name', with: 'Skywalker'
    page.execute_script("$('.form_datetime').datepicker('update', '1992-02_01');")
    click_button 'Create Student'
    expect(page).to have_content '1992-02_01'
  end

end
