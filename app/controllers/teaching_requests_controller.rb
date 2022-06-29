class TeachingRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!, only: [:edit, :index]

  def create
    @request = TeachingRequest.new(request_params)
    @request.user_id = current_user.id
    if @request.save
      @request.send_confirmation_email!
      #request.send_notification_email! # TODO sent notification to moderators
      redirect_to url: "/teaching_material", notice: "Thank you, your request is being process"
    else
      render root_path, status: :unprocessable_entity
    end
  end

  def index
    @requests = TeachingRequest.all.order(created_at: :desc)
  end

  def edit
    request = TeachingRequest.find_by id: params[:req]
    puts request
    if params[:validated?] == "true"
      request.update(:validated? => true)
    else
      request.update(:validated? => false)
    end
    request.update(:waiting? => false)
    request.save
    redirect_to action: :index and return
  end

  private

  def request_params
    params.permit(:job, :why)
  end

end


