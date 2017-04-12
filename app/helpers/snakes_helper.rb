module SnakesHelper

  def have_not_booked(snake)
    snakes_youve_booked = []
    bookings = Booking.where(user_id: current_user.id)
    bookings.each do |i|
      snakes_youve_booked << i.snake.id
    end

    output = snakes_youve_booked.include?(snake.id) ? false : true
    puts "Bookings:"
    puts bookings
    puts "Output:"
    puts output
    puts "Snake id"
    puts snake.id
    puts "ids of snakes you've booked"
    print snakes_youve_booked

    return output
  end

end
