require 'spec_helper'

feature 'Nominations' do
  given(:user) { create(:user, email: 'example@ucsd.edu') }
  # before { sign_in(user) }

  scenario 'A user must enter the minimally required fields for a nomination to be saved' do
    expect(Nomination.count).to eq 0
    skip 'wip'

    expect(Nomination.count).to eq 1
    expect(last_email.body).to have_content 'NOTE: This nomination is incomplete and will not be reviewed until all required materials are included.' 
  end

  scenario 'After saving a nomination a user receives a confirmation email with the deadline and a link to edit the nomination.' do
    skip 'wip'

    sign_in(user)

    expect(last_email.body).to have_content Settings.deadline
    expect(last_email.body).to have_content "https://siebel.ucsd.edu/nominations/#{nomination.slug}?auth_token=#{user.authentication_token}"
  end

  scenario 'An incomplete nomination is marked as such in the confirmation email and the nomination views' do
    skip 'wip'

    sign_in(user)

    expect(last_email.body).to have_content "NOTE: This nomination is incomplete and will not be reviewed until all required materials are included.  Please add the required info by #{Settings.deadline.strftime('%l:%M %p on %b %e')}"
    expect(last_email.body).to have_content "https://siebel.ucsd.edu/nominations/#{nomination.slug}?auth_token=#{user.authentication_token}"
  end

  scenario 'An complete nomination is marked as such in the confirmation email and the nomination views' do
    skip 'wip'

    sign_in(user)

    expect(last_email.body).to have_content "This nomination appears to have all of the required documents. You may update the data until #{Settings.deadline.strftime('%l:%M %p on %b %e')}"
  end

  scenario 'A user can must enter the minimally required fields for it to be saved' do
    skip 'wip'
    sign_in(user)
    
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please open the link to activate your account.'
    expect(User.count).to be 1
  end
end
