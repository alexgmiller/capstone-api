class PostsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
  
  def index
    @posts = Post.all
    render template: "posts/index"
  end

  def create
    @post = Post.new(
      title: params[:title],
      text: params[:text],
      user_id: current_user.id,
      game_id: params[:game_id]
    )
    if @post.save
      render template: "posts/show"
    else
      render json: {errors: @post.errors.full_messages}, status: 422
    end
  end

  def show
    @post = Post.find(params[:id])
    render template: "posts/show"
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:title] || @post.title
    @post.text = params[:text] || @post.text
    @post.game_id = params[:game_id] || @post.game_id
    @post.user_id = current_user.id
    if @post.save
      render template: "posts/show"
    else
      render json: {errors: @post.errors.full_messages}, status: 422
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: { message: "Post destroyed successfully!" }
  end
end
