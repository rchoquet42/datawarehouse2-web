class UsersController < ApplicationController
  require 'securerandom'
  before_action :authenticate_user!, only: [:edit, :destroy, :update]
  before_action :admin_user!, only: [:index, :delete]

  def index
    @users = User.all.order(created_at: :desc)
  end

  def create
    @user = User.new(create_user_params)
    if @user.save
      @user.send_confirmation_email!
      redirect_to root_path, notice: "Please check your email for confirmation instructions."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.authenticate(params[:user][:current_password])
      if @user.update(update_user_params)
        if params[:user][:unconfirmed_email].present?
          @user.send_confirmation_email!
          redirect_to root_path, notice: "Check your email for confirmation instructions."
        else
          puts "account updated"
          redirect_to root_path, notice: "Account updated."
        end
      else
        render :edit, status: :unprocessable_entity
      end
    else
      flash.now[:error] = "Incorrect password"
      render :edit, status: :unprocessable_entity
    end
  end



  def new
    if admin_user?
      new_from_admin
    else
      @user = User.new
    end
  end


  def delete #call by admin
    user = User.find_by id: params[:id]
    user.destroy
    redirect_to action: :index, notice: "Account has been deleted"
  end

  def destroy #call by user to self delete their account
    current_user.destroy
    reset_session
    redirect_to root_path, notice: "Your account has been deleted."
  end




  private

  def new_from_admin
    if User.exists? email: params[:email]
      redirect_to action: :index
    else
      newuser = User.new firstname: params[:firstname],
                         lastname: params[:lastname],
                         email: params[:email],
                         created_at: DateTime.now,
                         updated_at: DateTime.now,
                         password_digest: BCrypt::Password.create(SecureRandom.hex),
                         confirmed_at: DateTime.now #todo creer un bouton confirm si pas d'émail reçu

      newuser.save
      redirect_to action: :index and return
    end
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

  def create_user_params
    params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
  end

  def update_user_params
    params.require(:user).permit(:firstname, :lastname, :current_password, :password, :password_confirmation, :unconfirmed_email)
  end

end
