class PostsController < ApplicationController
  before_action :authenticate_admin
  def index
    @posts = Post.all
    render template: "posts/index"
  end

  def create
    @post = Post.new(
      name: params[:name],
      price: params[:price],
      # image_url: params[:image_url],
      description: params[:description],
    )
    if @post.save
      render :show # Same as => `render template: "posts/show"`
    else
      render json: {errors: @post.errors.full_messages}, status: 422
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render template: "posts/show"
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.name = params[:name] || @post.name
    @post.price = params[:price] || @post.price
    # @post.image_url = params[:image_url] || @post.image_url
    @post.description = params[:description] || @post.description
    if @post.save
      render :show # Same as => `render template: "posts/show"`
    else
      render json: {errors: @post.errors.full_messages}, status: 422
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    render json: { message: "Post destroyed successfully!" }
  end
end
