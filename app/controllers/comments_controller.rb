require 'pry'
class CommentsController < ApplicationController

  # NOTE: Index page for comments is on the posts show page --> '/post/:id' since only comments belong to a post are shown.
  
  get '/posts/:post_id/comments/new' do #create comment
    @post = Post.find_by_id(params[:post_id])
    erb :'comments/new'
  end

  post '/posts/:post_id/comments' do  #save the created comment
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


  get '/posts/:post_id/comments/:comment_id' do #show a single comment
    if logged_in?
      @post_id = params[:post_id]
      @comment = Comment.find_by_id(params[:comment_id])
      @time_ago = Time.now - @comment.updated_at
      erb :'comments/show'
    else
      redirect_if_not_logged_in
    end
  end

  get '/posts/:post_id/comments/:comment_id/edit' do #edit comment
    if logged_in?
      @post_id = params[:post_id]
      @comment = Comment.find_by_id(params[:comment_id])
      if @comment.user_id == current_user.id
        erb :'comments/edit'
      else
        redirect to "/posts/#{@post_id}" #redirect to comments index
      end
    else
      redirect_if_not_logged_in
    end
  end

  patch '/posts/:post_id/comments/:comment_id' do
    if logged_in?
      @post_id = params[:post_id]
      @comment = Comment.find_by_id(params[:comment_id])
      if params[:comment][:content] == ""
        redirect to "/posts/#{@post_id}/comments/#{@comment.id}/edit"
      else
        @comment.update(params[:comment])
        @comment.save
        redirect to "/posts/#{@post_id}/comments/#{@comment.id}"
      end
    else
      redirect_if_not_logged_in
    end
  end
  
  delete '/posts/:post_id/comments/:comment_id/delete' do #delete comment
    if logged_in?
      @post_id = params[:post_id]
      @comment = Comment.find_by_id(params[:comment_id])
      if @comment.user_id == current_user.id
        @comment.delete
        redirect to "/posts/#{@post_id}" #redirect to comments index
      else
        redirect to "/posts/#{@post_id}" #redirect to comments index
      end
    else
      redirect_if_not_logged_in
    end
  end
end #of class