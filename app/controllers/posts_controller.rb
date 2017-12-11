class PostsController < ApplicationController
  
  get '/posts' do
    if logged_in?
      @user = User.find_by_id(session[:user_id])
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
    if params[:post][:title] == "" || params[:post][:content] == "" || params[:post][:start_date] == "" || params[:post][:end_date] == ""
      # end date needs to be greater than start date.
      # flash[:message] = "Must fill in all parts"
      redirect to '/posts/new'
    else
      post = params[:post] #all post params
      post[:user_id] = session[:user_id] 
      @post = Post.create(post) #create post with all post params and user_id
      @post.save
    end
    redirect to "/posts/#{@post.id}"
  end

  get '/posts/:post_id' do  #also index page for comments
    if logged_in?
      @post = Post.find_by_id(params[:post_id])
      @comments = Comment.where("post_id = #{@post.id}") #all comments where post id is == the current post id
      @time_ago = Time.now - @post.updated_at
      binding.pry
      erb :'posts/show'
    else
      redirect_if_not_logged_in
    end
  end

  get '/posts/:post_id/edit' do
    if logged_in?
      @post = Post.find_by_id(params[:post_id])
      if @post.user_id == current_user.id
       erb :'posts/edit'
      else
        redirect to '/posts'
      end
    else
      redirect_if_not_logged_in
    end
  end

  patch '/posts/:post_id' do
    if logged_in?
      @post = Post.find_by_id(params[:post_id])
      if params[:post][:title] == "" || params[:post][:content] == "" || params[:post][:start_date] == "" || params[:post][:end_date] == ""
        #flash[:message] = "Must fill in all parts"
        redirect to "/posts/#{@post.id}/edit"
      else
        @post.update(params[:post])
        @post.save
        redirect to "/posts/#{@post.id}"
      end
    else
      redirect_if_not_logged_in
    end
  end

  delete '/posts/:post_id/delete' do
   if logged_in?
      @post = Post.find_by_id(params[:post_id])
      if @post.user_id == current_user.id
        @post.delete
        redirect to '/posts'
      else
        redirect to '/posts'
      end
    else
      redirect_if_not_logged_in
    end
  end
end #of class