class GamesController < ApplicationController
  def index
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    redirect_to Game.create
  end

  def update
    @game = Game.find(params[:id])
    @game.play!(params[:row], params[:col])

    respond_to do |format|
      format.html { redirect_to @game }
    end
  end
end
