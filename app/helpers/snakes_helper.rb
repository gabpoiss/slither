module SnakesHelper

  def have_not_booked(snake)
    snakes_youve_booked = []
    Booking.where(user_id: current_user.id).each do |i|
      snakes_youve_booked << i.snake
    end
    snakes_youve_booked.include? snake ? false : true
  end

end
