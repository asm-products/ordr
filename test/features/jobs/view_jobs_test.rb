require 'test_helper'

feature 'When a user visits their dashboard they can see all their jobs' do
  scenario "users cannot see other users jobs" do
    visit root_path
    fill_in 'email', with: "jane@example.com"
    fill_in 'password', with: "password4321"
    find('.list').click_on I18n.t('session.new_session.sign_in')
    page.text.wont_include('Junior Developer')
  end

  scenario "should see all jobs on dashboard" do
    visit root_path
    fill_in 'email', with: "john@example.com"
    fill_in 'password', with: "password1234"
    find('.list').click_on I18n.t('session.new_session.sign_in')
    page.text.must_include('Mobile App Software Developer')
    page.text.must_include("Junior Developer")
  end

  scenario "Should be able to view job steps" do
    visit root_path
    fill_in 'email', with: "john@example.com"
    fill_in 'password', with: "password1234"
    find('.list').click_on I18n.t('session.new_session.sign_in')
    click_on("Junior Developer")
    page.text.must_include('Job Steps')
  end

  scenario "Should be able to view job details" do
    visit root_path
    fill_in 'email', with: "john@example.com"
    fill_in 'password', with: "password1234"
    find('.list').click_on I18n.t('session.new_session.sign_in')
    click_on("Junior Developer")
    page.text.must_include('Job Steps')
    click_on ('Job Details')
    page.text.must_include('Apply by')
  end
end
