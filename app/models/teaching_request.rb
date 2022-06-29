class TeachingRequest < ApplicationRecord
  belongs_to :user

  def send_confirmation_email!
    TeachingRequestMailer.confirmation(self, self.user).deliver_now
  end
end