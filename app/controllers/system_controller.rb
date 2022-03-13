class SystemController < ApplicationController
  skip_before_action :login_required, only: [:index, :login]

  def index
    if logged_in?
      if Staff.find_by(account: current_user.account)
        redirect_to '/system/staffs'
      elsif Student.find_by(account: current_user.account)
        redirect_to '/system/students'
      end
    end
  end

  def login
    @user = login_params

    if Staff.exists?(account: params[:Account])
      @Staff = Staff.find_by(account: params[:Account])

      if @Staff.authenticate(params[:Password])
        redirect_to '/system/staffs'
        #session[:user_A] = @Staff.account
        create_auth_session(@Staff)
      else
        flash.now[:error] = "Password Incorrect"
        render :index
      end

    elsif Student.exists?(account: params[:Account])
      @Student = Student.find_by(account: params[:Account])

      if @Student.authenticate(params[:Password])
        redirect_to '/system/students'
        #session[:user_A] = @Student.account
        create_auth_session(@Student)
      else
        flash.now[:error] = "Password Incorrect"
        render :index
      end

    else
      flash.now[:error] = "Account Incorrect"
      render :index
    end

  end

  def logout
    #session.delete(:user_A)
    auth_session.invalidate!
    redirect_to root_url, alert: "Logged out"
  end

  private
  # Only allow a list of trusted parameters through.
  def login_params
    params.permit(:Account, :Password, :authenticity_token, :commit)
  end
end
