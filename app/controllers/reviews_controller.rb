class ReviewsController < ApplicationController

  def new
    @user = current_user
    @snake = Snake.find(params[:snake_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.snake = Snake.find(params[:snake_id])
    @review.booking = Booking.where(user: current_user, snake_id: params[:snake_id])[0]
    @review.user = current_user
    if @review.save
      redirect_to snake_path(@review.snake)
    end
  end

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
