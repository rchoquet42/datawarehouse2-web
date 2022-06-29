class TeachingRequestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.teaching_request_mailer.confirmation.subject
  #

  def confirmation(teachingreq, user)
    @teachingreq = teachingreq
    @user = user

    mail to: @user.email, subject: "Confirmation of request to access teaching material"
  end


end
