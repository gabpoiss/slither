class SnakesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index

    @snakes = Snake.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@snakes) do |snake, marker|
      marker.lat snake.latitude
      marker.lng snake.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end

#     @snakes = Snake.order(price: :desc)

#     if current_user
#       @snakes = Snake.where.not(user_id: current_user.id).order(price: :desc)
#     else
#       @snakes = Snake.all.order(price: :desc)
#     end
  
      if params[:search]&& params[:search][:sex].present?
      @snakes = @snakes.where(sex: params[:search][:sex])
    end
      if params[:search] && params[:search][:price].present?
      @snakes = @snakes.where(price: params[:search][:price])
    end


    snake_prices = []
    Snake.all.each do |snake|
      snake_prices << snake.price
    end

    @prices = snake_prices.uniq.sort

  end

  def show
    @snake = Snake.find(params[:id])
    @alert_message = "You are viewing #{@snake.name}"
    @snake_coordinates = { lat: @snake.latitude, lng: @snake.longitude }
    if !Review.where(:user => current_user).nil?
      @review = Review.where(:user => current_user)
    else
      @review = Review.new
    end
  end

  def new
    snake_breeds = []
    Snake.all.each do |snake|
      snake_breeds << snake.breed
    end

    @breeds = snake_breeds.uniq.sort

    # @breeds = Snake.limit(5).select("breed").each { |breed| puts "#{breed}" }
  end

  def create
    @new_snake = Snake.new(snake_params)
    @new_snake.user = current_user
    @breeds = Snake.all.select("breed")
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
    current_user.snakes_booked_notifications = 0
    current_user.save
    @user = User.find(params[:user_id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def snake_params
    params.require(:snake).permit(:name, :breed, :sex, :available, :price, :photo, :location)
  end
end
