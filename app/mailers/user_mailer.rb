class UserMailer < ActionMailer::Base
  default from: "job_search_team@cool_dudes.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.network_reminder.subject
  #
  def network_reminder(user)
    @user = user

    mail(to: user.email, subject: "Network Reminder")
  end
end
