class GamesController < ApplicationController
  respond_to :json
 
  def index
    respond_with Game.all
  end

  def show
    respond_with Game.find(params[:id])
  end

  def create
    respond_with Game.create(params[:id])
  end

  def update
    respond_with Game.update(params[:id], params[:game])
  end

  def destroy
    respond_with Game.destroy(params[:id])
  end
end