class SessionController < ApplicationController
  def new
  end

  def create
    raise 'BOOM'
    user = login(params[:email], params[:password])
    # TODO: check session
    # TODO: check user type so redirect to right place
    session[:id] = user.id
    # dont need to save user just store user details in session
    # if user.save
    #   redirect_to patient_index_path(user), :notice => "Logged in!"
    # else
    #   flash.now.alert = "Email or password was invalid."
    # end
  end

  user = login(params[:sessions][:email],
                 params[:sessions][:password],
                 params[:sessions][:remember_me])
end