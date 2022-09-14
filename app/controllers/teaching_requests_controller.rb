class TeachingRequestsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user!, only: [:edit, :index]

  def create
    puts "creating request"
    departement = Department.new(dep_request_params)
    @request = TeachingRequest.new(request_params)

    @request.user_id = current_user.id
    @request.departement_id = departement.id
    if @request.save
      departement.save
      @request.send_confirmation_email!
      #request.send_notification_email! # TODO sent notification to moderators
      redirect_to url: "/teaching_material", alert: "Thank you, your request is being process"
    else
      render root_path, status: :unprocessable_entity
    end
  end

  def index
    @requests_pending = TeachingRequest.where(waiting?: true)
    @requests_accepted = TeachingRequest.where(waiting?: false, validated?: true)
    @requests_rejected = TeachingRequest.where(waiting?: false, validated?: false)
  end

  def edit
    request = TeachingRequest.find_by id: params[:req]
    if params[:validated?] == "true"
      request.update(:validated? => true)
    else
      request.update(:validated? => false)
    end
    if request.waiting? #Send email only the first time
      request.send_validation_email!
    end
    request.update(:waiting? => false)
    request.save
    redirect_to action: :index and return
  end

  private

  def request_params
    params.permit(:job, :why)
  end

  def dep_request_params
    params.permit(:institution, :department, :head, :head_email, :city)
  end

end


