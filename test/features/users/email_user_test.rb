require 'test_helper'

feature "create an email and password" do
  scenario "should let a new user sign up" do
    visit root_path
    click_link I18n.t('session.new_session.sign_up')
    fill_in 'user_email', with: "new_user@localhost.com"
    fill_in 'user_password', with: "securepassword"
    fill_in 'user_password_confirmation', with: "securepassword"
    click_button I18n.t('session.new_session.sign_up')
    page.text.must_include I18n.t('session.messages.new_user.email', user: "new_user@localhost.com")
  end
end

feature "sign in with email and password" do
  scenario "valid email" do
    visit root_path
    fill_in 'email', with: "test_user@localhost.com"
    fill_in 'password', with: "securepassword"
    find('.list').click_on I18n.t('session.new_session.sign_in')
    page.text.must_include I18n.t('session.messages.returning_user.email', user: "test_user@localhost.com")
  end

  scenario "invalid password" do
    visit root_path
    fill_in 'email', with: "test_user@localhost.com"
    fill_in 'password', with: "not_the_right_password"
    find('.list').click_on I18n.t('session.new_session.sign_in')
    page.text.wont_include I18n.t('session.messages.returning_user.email', user: "test_user@localhost.com")
    page.text.must_include I18n.t('session.messages.failed_login.email')
  end

  scenario "invalid email won't crash the database" do
    visit root_path
    fill_in 'email', with: "not_a_user@localhost.com"
    fill_in 'password', with: "password"
    find('.list').click_on I18n.t('session.new_session.sign_in')
    page.text.wont_include I18n.t('session.messages.returning_user.email', user: "test_user@localhost.com")
    page.text.must_include I18n.t('session.messages.failed_login.email')
  end
end
