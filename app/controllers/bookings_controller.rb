class BookingsController < ApplicationController

  def index
    snake = Snake.find(params[:snake_id])
    user = snake.user
    if user == current_user
      @bookings = Booking.where(snake: snake)
    else
      redirect_to snake_path(snake)
    end
  end

  def show
    snake = Snake.find(params[:snake_id])
    user = snake.user
    if user == current_user
      @booking = Booking.find(params[:id])
    end
  end

  def new
  end

  def create
    snake = Snake.find(params[:snake_id])
    new_booking = Booking.new(booking_params)
    new_booking.confirmed = nil
    new_booking.snake = snake
    new_booking.user = current_user
    if new_booking.save
      # once the the snake book page has been built out.
      # redirect_to snake_booking_path(new_booking)
      # until then:
      redirect_to snake_path(snake)
    else
      redirect_to snake(snake)
    end
  end

  def edit
    snake_owner = Snake.find(params[:snake_id]).user
    booker = Booking.find(params[:id]).user
    unless snake_owner == current_user || booker == current_user
      redirect_to snakes_path
    end
  end

  def update
    booking = Booking.find(params[:id])
    snake_owner = Snake.find(params[:snake_id]).user
    booker = booking.user
    if snake_owner == current_user
      booking.update(confirmed: true)
    elsif booker = current_user
      booking.update(booking_params)
    end
    if booking.valid?
      redirect_to snake_booking_path(booking)
    else
      redirect_to edit_snake_path(booking)
    end
  end

  def destroy
    booking = Booking.find(params[:id])
    if booking.snake.user == current_user
      booking.destroy
      redirect_to snake_bookings_path
    end
  end

  def booking_params
    params.require(:booking).permit(:from, :until)
  end
end
