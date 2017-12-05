class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/posts' #in posts_controller.
    else
      erb :'users/signup'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'  #how can you raise an error here? "You must fill in the all parts of the form to create an account."
    else
      @user = User.create(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect '/posts' #in posts_controller.
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/posts' #in posts_controller.
    else
      redirect '/login'
    end
  end


end
 