class ApplicationController < ActionController::Base
  include Authentication #dans 'concern'
  include Role #Dans 'concern'

end
