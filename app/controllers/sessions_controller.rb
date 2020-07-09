class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params[:email]
    @user = User.find_by(email: params[:email]) if params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/login'
    end
  end

  def destroy
    if session[:user_id]
      session.delete(:user_id)
    end
    redirect_to root_path
  end

  def create_from_omni
    @user = User.find_or_create_by(uid: auth[:uid]) do |u|
      u.name = auth[:info][:name]
      u.email = auth[:info][:email]
      u.password = Random.hex
    end
    session[:user_id] = @user.id

    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
