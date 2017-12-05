require './config/environment'

class ApplicationController < Sinatra::Base

  # set :views, Proc.new { File.join(root, "../views/") }

  configure do
    set :public_folder, 'public'
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security_key"
  end

  get '/' do
    @user = User.find_by_id(session[:user_id])
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end

end #of class
