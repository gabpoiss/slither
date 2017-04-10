class SnakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @snakes = Snake.all
  end

  def show
    @snake = Snake.find(params[:id])
  end

  def new
  end

  def create
    @new_snake = Snake.new(snake_params)
    @new_snake.user = current_user
    if @new_snake.save
      redirect_to snake_path(@new_snake)
    else
      redirect_to new_snake_path
    end
  end

  def edit
    if Snake.find(params[:id]).user == current_user
      @snake = Snake.find(params[:id])
    end
  end

  def update
    @snake = Snake.edit(snake_params)
    if @snake.save
      redirect_to snake_path(@snake)
    else
      redirect_to edit_snake(@snake)
    end
  end

  def destroy
    if Snake.find(params[:id]).user == current_user
      @snake = Snake.find(params[:id])
      @snake.destroy
      redirect_to user_snake_path(current_user)
    end
  end

  def snake_params
    params.require(:snake).permit(:name, :breed, :sex, :available, :price)
  end
end
