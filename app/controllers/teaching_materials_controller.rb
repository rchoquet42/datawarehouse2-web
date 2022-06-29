class TeachingMaterialsController < ApplicationController
  helper_method :access_teaching?
  helper_method :teaching_requested?

  def index
  end


  def access_teaching?
    teachingrequest = TeachingRequest.find_by user_id: current_user.id
    unless teachingrequest.nil?
      return teachingrequest.validated?
    end
    false
  end

  def teaching_requested?
    teachingrequest = TeachingRequest.find_by user_id: current_user.id
    unless teachingrequest.nil?
      return teachingrequest.waiting?
    end
    false
  end

end
