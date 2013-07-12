class SessionController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password])
    binding.pry
    if user.
      redirect_to , :notice => "Logged in!"
    else
      flash.now.alert = "Email or password was invalid."
    end
  end
end