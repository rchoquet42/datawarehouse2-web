module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_user
    helper_method :current_user
    helper_method :user_signed_in?
    helper_method :admin_user?
    helper_method :admin_user_id?
  end

  def forget(user)
    cookies.delete :remember_token
    user.regenerate_remember_token
  end

  def remember(user)
    user.regenerate_remember_token
    cookies.permanent.encrypted[:remember_token] = user.remember_token
  end

  def login(user)
    reset_session
    session[:current_user_id] = user.id
  end

  def logout
    reset_session
  end

  def redirect_if_authenticated
    redirect_to root_path, alert: "You are already logged in." if user_signed_in?
  end

  def authenticate_user!
    store_location
    redirect_to login_path, alert: "You need to login to access that page." unless user_signed_in?
  end

  def access_teaching!
    store_location
    redirect_to login_path, alert: "You need to login to access that page." unless access_teaching?
  end



  private


  def access_teaching?
    teachingrequest = TeachingRequest.find_by user_id: current_user.id
    unless teachingrequest.nil?
      return teachingrequest.validated?
    end
    if admin_user?
      return true
    end
    false
  end

  def current_user
    Current.user ||= if session[:current_user_id].present?
                       User.find_by(id: session[:current_user_id])
                     elsif cookies.permanent.encrypted[:remember_token].present?
                       User.find_by(remember_token: cookies.permanent.encrypted[:remember_token])
                     end
  end

  def user_signed_in?
    Current.user.present?
  end

  def store_location
    session[:user_return_to] = request.original_url if request.get? && request.local?
  end



end