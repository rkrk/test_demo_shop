class NoticeMailer < ActionMailer::Base
  default :from => "demoshop@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_register_confirm.subject
  #
  def sendmail_register_confirm(user)
    @greeting = "Hi"
    @user = user

    mail :to => user.user_email, :subject => "Thank you for your register!"
  end
end
