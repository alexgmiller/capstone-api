class PostsController < ApplicationController
  before_action :authenticate_admin
  def index
    @posts = Post.all
    render template: "posts/index"
  end

  def create
    @post = Post.new(
      title: params[:title],
      text: params[:text],
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
    @post.title = params[:title] || @post.title
    @post.text = params[:text] || @post.text
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
