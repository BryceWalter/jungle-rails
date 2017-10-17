require 'rails_helper'

RSpec.feature "When user logs in", type: :feature, js: true do
  before :each do
    User.create!({
      first_name: 'Bob',
      last_name: 'Ross',
      email: 'happy.little@trees.com',
      password: 'joyofpainting'
      })
  end

  scenario 'they see a single product page' do

    visit '/login'
    fill_in 'email', with: 'happy.little@trees.com'
    fill_in 'password', with: 'joyofpainting'

    click_on 'Submit'

    within('nav button.login') { expect(page).to have_content('happy.little@trees.com') }
  end

end
