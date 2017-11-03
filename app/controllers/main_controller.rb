class MainController < ApplicationController

def register
  # if session[:user].nil?
  #   @usernames = YAML.load(session[:user])
  # end
  render 'register.html.erb'
end

def login
  # if !@user_info == nil
  #   @user_info = YAML.load(session[:user])
  # end

  if !params.has_key?(:logout)
    params.require(:first_name)
    params.require(:last_name)
    params.require(:email)
    params.require(:user)
    params.require(:password)
    params.permit(:address, :city, :state, :zip, :country)
  end
  # if @usernames.nil? #trying to store usernames in an array so you can't make duplicate accounts
  #   @usernames = []
  # end
  # if !@usernames.include?(params[:user])
    @user_info = Main.new(params[:first_name], params[:last_name], params[:email], params[:user], params[:password], params[:address], params[:city], params[:state], params[:zip], params[:country])
    # @usernames << params[:user]
    session[:user] = @user_info.to_yaml
    render 'login.html.erb'
  # else
  #   flash.now[:alert] = "That username is already taken. Please choose another one."
  #   redirect_to '/'
  # end
end


def logged_in
  @user_info = YAML.load(session[:user])
  if @user_info.valid == false
    params.require(:user_login)
    params.require(:password_login)
  end
  if @user_info.user == params[:user_login] && @user_info.password == params[:password_login]
    @user_info.validswitch
  end
  if @user_info.valid == true
    render 'logged_in.html.erb'
  else
    flash.now[:alert] = "Your login credentials do not match. Please try again."
    render 'login.html.erb'
  end
  session[:user] = @user_info.to_yaml
end

def logout
  @user_info = YAML.load(session[:user])
  if params.has_key?(:logout)
    flash.now[:alert] = "You are logged out."
  end
  session[:user] = @user_info.to_yaml
  render 'login.html.erb'
end

end
