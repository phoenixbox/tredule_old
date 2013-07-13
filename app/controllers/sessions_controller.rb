class SessionsController < ApplicationController
  def new
  end

  def create
    user = login( params[:sessions][:email],
                  params[:sessions][:password])
    # TODO: check session
    # TODO: check user type so redirect to right place
    if user
      redirect_to patient_path(user), notice: "Successfully logged in!"
    else
      redirect_to root_path, notice: "Log-in un-successful please retry"
    end
    session[:id] = user.id
  end

  # user = login(params[:sessions][:email],
  #                params[:sessions][:password],
  #                params[:sessions][:remember_me])
end