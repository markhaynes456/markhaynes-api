class PostsController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_filter :set_headers

  def index
    render json: Post.all	
  end

  def show
    @post = Post.find(set_post)
    render json: @post	
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def edit
    @post = self.set_post
  end

  def update
    @post = self.set_post    
    @post.update_attributes(post_params)
    if @post.image
      @post.update_attributes(image_url:'http://localhost:3000'+@post.image.url)
    end
    render json: @post, status: :ok, location: @post
  end

  def destroy
    @post = self.set_post
    if @post.destroy
      render json: {}, status: :ok
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title,:subtitle,:intro,:body,:outro, :image)
  end

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Expose-Headers'] = 'ETag'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PATCH, PUT, DELETE, OPTIONS, HEAD'
    headers['Access-Control-Allow-Headers'] = '*,x-requested-with,Content-Type,If-Modified-Since,If-None-Match'
    headers['Access-Control-Max-Age'] = '86400'
  end
	
end
