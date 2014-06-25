require 'test_helper'

feature "create an email and password" do
  scenario "should let a new user sign up" do
    visit root_path
    click_on I18n.t('session.new_session.sign_up')
    fill_in 'user_email', with: "new_user@localhost.com"
    fill_in 'user_password', with: "securepassword"
    fill_in 'user_password_confirmation', with: "securepassword"
    click_on I18n.t('session.new_session.sign_up')
    page.text.must_include I18n.t('session.messages.new_user.email', user: "new_user@localhost.com")
  end
end
