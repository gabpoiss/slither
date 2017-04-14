class BookingsController < ApplicationController

  def index
    @snake = Snake.find(params[:snake_id])
    @user = @snake.user
    if @user == current_user
      @bookings = Booking.where(snake: @snake)
    else
      redirect_to snake_path(@snake)
    end
  end

  def show
    @booking = Booking.find(params[:id])
    snake = Snake.find(params[:snake_id])
    snake_owner = snake.user
    guy_booking_the_snake = @booking.user
    unless current_user == guy_booking_the_snake || current_user == snake_owner
      redirect_to snakes_path
    end
  end

  def new
    @snake_id = params[:snake_id]
  end

  def create
    date_from = Date.strptime(params[:booking][:from].gsub("/", "-"), '%m-%d-%Y')
    date_until = Date.strptime(params[:booking][:until].gsub("/", "-"), '%m-%d-%Y')

    snake = Snake.find(params[:snake_id])
    new_booking = Booking.new(from: date_from, until: date_until)
    new_booking.confirmed = nil
    new_booking.snake = snake
    new_booking.user = current_user
    if new_booking.save
      # once the the snake book page has been built out.
      # redirect_to snake_booking_path(new_booking)
      # until then:
      snake.user.snakes_booked_notifications += 1
      snake.user.save
      redirect_to snake_path(snake)
    else
      redirect_to snake_path(snake)
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
      booker.bookings_responses_notification += 1
      booker.save
    elsif booker = current_user
      booking.update(booking_params)
    end
    if booking.valid?
      redirect_to snake_booking_path(booking.snake, booking)
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

  def user_show
    current_user.bookings_responses_notification = 0
    current_user.save
    @user = User.find(params[:user_id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def booking_params
    params.require(:booking).permit(:from, :until)
  end
end
