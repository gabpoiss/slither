module SnakesHelper

  def have_not_booked(snake)
    return true unless current_user
    snakes_youve_booked = []
    bookings = Booking.where(user_id: current_user.id)
    bookings.each do |i|
      snakes_youve_booked << i.snake.id
    end

    output = snakes_youve_booked.include?(snake.id) ? false : true
    return output
  end

end
