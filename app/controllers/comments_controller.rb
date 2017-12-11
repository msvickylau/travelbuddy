class CommentsController < ApplicationController


  get '/posts/:post_id/comments' do #comments index page, off of the posts show page
    erb :'comments/index'
  end
  
  get '/posts/:post_id/comments/new' do #create comment
    @post = Post.find_by_id(params[:post_id])
    erb :'comments/new'
  end

  post '/posts/:post_id/comments' do
    post_id = params[:post_id]
    if params[:comment][:content] == "" 
      redirect to '/posts/#{post_id}/comments/new'
    else
      comment = params[:comment]
      comment[:post_id] = params[:post_id]
      comment[:user_id] = session[:user_id]
      @comment = Comment.create(comment)
      @comment.save
    end
    redirect to "/posts/#{post_id}/comments/#{@comment.id}"
  end

  get '/posts/:post_id/comments/:comment_id' do #show comment
    if logged_in?
      # @post = Post.find_by_id(params[:post_id])
      @comment = Comment.find_by_id(params[:comment_id])
      @time_ago = Time.now - @comment.updated_at
      erb :'comments/show'
    else
      redirect_if_not_logged_in
    end
  end


  # get '/posts/:id/posts/:id' do
  #   if logged_in?
  #     @post = Post.find_by_id(params[:id])
  #     @time_ago = Time.now - @post.updated_at
  #     erb :'posts/show'
  #   else
  #     redirect_if_not_logged_in
  #   end
  # end

  # get '/comments/:id/edit' do #edit comment
  # end

  # patch '/comments/:id' do 
  # end

  # delete '/comments/:id/delete' do #delete comment
  # end

  
end #of class
