def sign_up(first_name, last_name, email)
  visit new_user_registration_path
  within('#new_user') do
    fill_in 'user_first_name', with: first_name
    fill_in 'user_last_name', with: last_name
    fill_in 'user_email', with: email
  end
  click_button 'Sign up'
end

def sign_in(user=create(:confirmed_user))
  visit new_user_registration_path
  within('#new_user') do
    fill_in 'user_first_name', with: first_name
    fill_in 'user_last_name', with: last_name
    fill_in 'user_email', with: email
  end
  click_button 'Sign up'
end