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
    # raise
    if @new_snake.save
      redirect_to snake_path(@new_snake)
    end
  end

  def edit
    @snake = Snake.find(params[:id])
    if @snake.user == current_user
      @snake = Snake.find(params[:id])
    else
      redirect_to snake_path(@snake)
    end
  end

  def update
    @snake = Snake.find(params[:id])
    @snake.update(snake_params)
    if @snake.valid?
      redirect_to snake_path(@snake)
    else
      redirect_to edit_snake(@snake)
    end
  end

  def destroy
    if Snake.find(params[:id]).user == current_user
      @snake = Snake.find(params[:id])
      @snake.destroy
      # Redirect to list of user's snakes once that view has been built
      # redirect_to user_snake_path(current_user)
      # For now we'll redirect back to the main index of snakes
      redirect_to snakes_path
    end
  end

  def user_show
    @user = User.find(params[:user_id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def snake_params
    params.require(:snake).permit(:name, :breed, :sex, :available, :price, :photo)
  end
end
