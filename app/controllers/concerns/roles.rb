module Roles
  extend ActiveSupport::Concern

  ADMIN = 1
  MODERATOR = 2

  included do
    helper_method :admin_user?
  end

  def admin_user!
    store_location
    redirect_to login_path, alert: "You need to be ADMIN to access that page." unless admin_user?
  end


  def admin_user?
    if user_signed_in?
      user_role = UsersRole.find_by user_id: current_user.id
      unless user_role.nil?
        if user_role.role_id == ADMIN
          return true
        end
      end
    end
    return false
  end


end
