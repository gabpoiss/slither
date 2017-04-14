class ReviewsController < ApplicationController

  def new
    @user = current_user
    @snake = Snake.find(params[:snake_id])
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @snake = Snake.find(params[:snake_id])
    @review.snake = @snake
    @review.booking = Booking.where(user: current_user, snake_id: params[:snake_id])[0]
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to snake_path(@snake) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html {render '/snakes'}
        format.js
      end
    end
  end

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
