class ChaptersController < ApplicationController
  before_action :authenticate_user!, :access_teaching!

  def get
    send_file "#{Rails.configuration.teaching_material_location }/#{params[:type]}/#{params[:id]}.pdf", :disposition => 'attachment'
  end

  def index

  end

end
