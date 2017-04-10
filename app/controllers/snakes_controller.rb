class SnakesController < ApplicationController

  def index
    @snakes = Snake.all
  end

  def show
    @snake = Snake.find(params[:snake_id])
  end
end
