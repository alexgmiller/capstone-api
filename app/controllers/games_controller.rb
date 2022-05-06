class GamesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]  
  
  def index
    @games = Game.all
    render template: "games/index"
  end

  def create
    @game = Game.new(
      title: params[:title],
      genre: params[:genre],
      description: params[:description],
      image_url: params[:image_url]
    )
    if @game.save
      render :show # Same as => `render template: "games/show"`
    else
      render json: {errors: @game.errors.full_messages}, status: 422
    end
  end

  def show
    @game = Game.find(params[:id])
    render template: "games/show"
  end

  def update
    @game = Game.find(params[:id])
    @game.title = params[:title] || @game.title
    @game.image_url = params[:image_url] || @game.image_url
    @game.genre = params[:genre] || @game.genre
    @game.description = params[:description] || @game.description
    if @game.save
      render :show # Same as => `render template: "games/show"`
    else
      render json: {errors: @game.errors.full_messages}, status: 422
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    render json: { message: "game destroyed successfully!" }
  end
end
