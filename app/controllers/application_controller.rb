class ApplicationController < ActionController::Base
  include Authentication #dans 'concern'
  include Roles #Dans 'concern'

end
