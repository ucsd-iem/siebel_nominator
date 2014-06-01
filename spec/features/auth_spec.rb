require 'spec_helper'

feature 'Signing up' do
  scenario 'A user can sign up with an ucsd email' do
    sign_up('Example', 'User', 'example@ucsd.edu')
    
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please open the link to activate your account.'
    expect(User.count).to be 1
  end

  scenario 'A user cannot sign up without an ucsd email address' do
    sign_up('Example', 'User', 'example@gmail.com')
    
    expect(page).to have_content 'should be an UCSD email address.'
    expect(User.count).to be 0
  end

  scenario 'A user can confirm the account with the correct confirmation code and redirect to the new nomination form' do
    sign_up('Example', 'User', 'example@ucsd.edu')
    confirmation_token = last_email.body.match(/confirmation_token=(.*)"/)[1]
    visit user_confirmation_path(confirmation_token: confirmation_token)

    expect(page).to have_content 'Your account was successfully confirmed.'
  end
end

feature 'Signing in' do
  given(:user) { create(:user, email: 'example@ucsd.edu') }

  scenario 'A user can sign in with a token after clicking on the confirmation link in their email' do
    user.confirm!
    visit "nominations?auth_token=#{user.authentication_token}" # nominations_path(auth_token: user.authentication_token)

    expect(page).to have_link 'New Nomination'
  end

  scenario 'A user cannot sign in with a token before clicking on the confirmation link in their email' do
    visit nominations_path(auth_token: user.authentication_token)
    
    expect(page).to have_content 'You have to confirm your account before continuing.'
  end
end
