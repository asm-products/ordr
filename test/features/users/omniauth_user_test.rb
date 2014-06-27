require "test_helper"

feature "Mock Linkedin Authentication" do
  before do
    visit root_path
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({provider: 'linkedin', uid: '12345'})
    Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:linkedin]
    OmniAuth.config.add_mock(:linkedin,{uid: '12345',info: { name: 'linkedin_user'},})
  end
  scenario "sign in with Linkedin" do
    visit root_path
    click_link "Sign in with linkedin"
    page.text.must_include I18n.t('session.messages.new_user.omniauth', user: 'linkedin_user', provider: 'linkedin')
    visit root_path
    find('.main-header').click_on I18n.t('session.new_session.sign_out')
    page.text.must_include I18n.t('session.messages.logout')
  end
end
