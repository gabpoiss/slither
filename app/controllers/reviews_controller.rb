class ReviewsController < ApplicationController

  def new
  end

  def create
    @new_reivew = Review.new(review_params)
    @new_reivew.user = current_user
    @new_reivew.snake_id = params[:snake_id]
    # redirect_to snake_path(params[:snake_id])
  end

  def review_params
    params.require(:review).permit(:content, :stars)
  end
end
