class SessionsController < ApplicationController
  skip_after_action :verify_authorized

  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/articles'
    else
      redirect_to '/login'
    end
  end
end
