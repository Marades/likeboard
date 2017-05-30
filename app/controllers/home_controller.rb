class HomeController < ApplicationController
  before_action :authenticate_user!  #로그인이 되어있어야 이곳으로 옴
  def index
    @posts = Post.all
    
  end
  
  def create_post
    post = Post.new
    post.writer = current_user.name
    post.content = params[:content]
    post.save
    
    redirect_to '/'
  end
  
  def edit
    edit_post = Post.find(params[:post_id])
  end
  
  def delete
    delete_post = Post.find(params[:post_id])
    delete_post.destroy
    
    redirect_to '/'
  end
  
  def create_comment
    comment = Comment.new
    comment.writer = current_user.name
    comment.content = params[:content]  #view에서 name 으로 지정해준 것을 찾아올 수 있음
    comment.post_id = params[:post_id]
    comment.save
    
    redirect_to '/'
  end
  
  def like
    like = Like.find_by(user_id: current_user.id,
                        post_id: params[:post_id])
    
    if like.nil?
      Like.create(user_id: current_user.id,
                  post_id: params[:post_id])
    else
      like.destroy
    end
    
    redirect_to :back 
    
  end
end
