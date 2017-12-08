class PostsController < ApplicationController
  
  get '/posts' do
    if logged_in?
      @posts = Post.all
      erb :'posts/index'
    else
      redirect to '/login'
    end
  end

  get '/posts/new' do
    if logged_in?
      @destinations = Destination.all
      erb :'posts/new'
    else
      redirect to '/login'
    end
  end

  post '/posts' do
    if params[:title] == "" || params[:content] == "" || params[:start_date] == "" || params[:end_date] == ""
      redirect to '/posts/new'
    else
      @post = Post.create(
        title: params[:post][:title], 
        content: params[:post][:content], 
        start_date: params[:post][:start_date], 
        end_date: params[:post][:end_date], 
        user_id: session[:user_id]
        )
    end
    @post.save

    redirect to "/posts/#{@post.id}"
  end

  get '/posts/:id' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      @time_ago = Time.now - @post.created_at

      erb :'posts/show'
    else
      redirect to '/login'
    end
  end

  get '/posts/:id/edit' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      if @post.user_id == current_user.id
       erb :'posts/edit'
      else
        redirect to '/posts'
      end
    else
      redirect to '/login'
    end
  end

  # patch '/posts/:id'

  # delete '/posts/:id/delete'


end #of class