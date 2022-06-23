class UsersController < ApplicationController
  def index
    @users = User.all.order(created_at: :desc)
  end

  def new
    puts "Hello new"
    if User.exists? email: params[:email]
      redirect_to action: :index
    else

      newuser = User.new firstname: params[:firstname],
               lastname: params[:lastname],
               email: params[:email],
               created_at: DateTime.now,
               updated_at: DateTime.now
      newuser.save
      redirect_to action: :index
    end
  end

  def delete
    user = User.find_by id: params[:id]
    user.destroy
    redirect_to action: :index
  end

end
