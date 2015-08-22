class PostsController < ApplicationController

  def index
    render json: Post.all	
  end

  def show
    render json: Post.find(set_post)	
  end

  def create

  end

  def update

  end

  def delete

  end

  def set_post
    @post = Post.find(params[:id])
  end

end
