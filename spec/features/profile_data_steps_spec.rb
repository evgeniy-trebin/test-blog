require 'rails_helper'

RSpec.feature 'ProfileDataSteps', type: :feature do

  before(:each) do
    @user = create(:user, email: 'test@ya.ru', password: '123123123', password_confirmation: '123123123')
  end

  scenario 'sign in' do
    user_sign_in
    expect(current_path).to eq(account_profile_path)
    expect(page).to have_text('Signed in successfully.')
  end

  scenario 'fill form' do
    user_sign_in
    visit account_profile_data_step_path(:personal_info)
    within '#profile_personal_info_form' do
      fill_in 'profile[name]', with: 'Ivan'
      fill_in 'profile[surname]', with: 'Ivanov'
      fill_in 'profile[status_text]', with: 'MyCrazyStatus'
      click_button 'Submit'
    end
    expect(current_path).to eq(account_profile_data_step_path(:avatar))
    #TODO upload avatar
    click_link 'Skip'
    expect(current_path).to eq(account_profile_path)
    expect(page).to have_text 'Ivan'
    expect(page).to have_text 'Ivanov'
    expect(page).to have_text 'MyCrazyStatus'
  end

  def user_sign_in
    visit new_user_session_path
    expect(page).to have_text('Sign in')
    within '#new_user' do
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      click_button 'Log in'
    end
  end

end
