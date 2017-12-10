class PostsController < ApplicationController
  
  get '/posts' do
    if logged_in?
      @posts = Post.all
      erb :'posts/index'
    else
      redirect_if_not_logged_in
    end
  end

  get '/posts/new' do
    if logged_in?
      erb :'posts/new'
    else
      redirect_if_not_logged_in
    end
  end

  post '/posts' do
    if params[:title] == "" || params[:content] == "" || params[:start_date] == "" || params[:end_date] == ""
      flash[:message] = "Must fill in all parts"
      redirect to '/posts/new'
    else
      post = params[:post] #all post params
      post[:user_id] = session[:user_id] 
      @post = Post.create(post) #create post with all post params and user_id
      @post.save
    end
    redirect to "/posts/#{@post.id}"
  end

  get '/posts/:id' do
    if logged_in?
      @post = Post.find_by_id(params[:id])
      @time_ago = Time.now - @post.created_at

      erb :'posts/show'
    else
      redirect_if_not_logged_in
    end
  end

  # get '/posts/:id/edit' do
  #   if logged_in?
  #     @post = Post.find_by_id(params[:id])
  #     if @post.user_id == current_user.id
  #      erb :'posts/edit'
  #     else
  #       redirect to '/posts'
  #     end
  #   else
  #     redirect_if_not_logged_in
  #   end
  # end

  # patch '/posts/:id'

  # delete '/posts/:id/delete'


end #of class