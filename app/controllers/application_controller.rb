class ApplicationController < ActionController::Base
  before_action :login_required

  private
  def login_required
    unless logged_in?
      redirect_to root_url, :alert => "You must login to view this resource"
    end
  end

  #before_action :current_user, except: [:index, :login]
  #protected
  #def current_user
  # for displaying landing page and login.
  #  if session[:user_A]
  # pass
  #  else
  #    redirect_to root_url, alert: "Not authorized"
  #  end
  #end
end
