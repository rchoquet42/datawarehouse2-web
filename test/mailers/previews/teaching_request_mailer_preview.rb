# Preview all emails at http://localhost:3000/rails/mailers/teaching_request_mailer
class TeachingRequestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/teaching_request_mailer/confirmation
  def confirmation
    TeachingRequestMailer.confirmation
  end

end
