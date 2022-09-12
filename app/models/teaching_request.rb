class TeachingRequest < ApplicationRecord
  belongs_to :user

  def send_confirmation_email!
    TeachingRequestMailer.confirmation(self, self.user).deliver_now
  end

  def send_validation_email!
    if self.validated?
      TeachingRequestMailer.accepted(self, self.user).deliver_now
    else
      TeachingRequestMailer.rejected(self, self.user).deliver_now
    end
  end

end