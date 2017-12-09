class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if logged_in?
      redirect '/posts' #in posts_controller.
    else
      erb :'users/signup'
    end
  end


  #does not let a user sign up with a username/email/password
  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      flash[:message] = "Please don't leave blank content"
      redirect to '/signup'
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/posts' #in posts_controller.
    end
  end

  get '/login' do
    if logged_in?
      redirect '/posts'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/posts' #in posts_controller.
    else
      flash[:message] = "The username/password you've entered is incorrect. Please try again."
      redirect_if_not_logged_in
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect_if_not_logged_in
    else
      redirect to '/'
    end
  end

end #of class
 