module PagesHelper
  def total_notifications(cu)
    cu.snakes_booked_notifications + cu.bookings_responses_notification
  end

  def snakes_booked_notifications(cu)
    a = cu.snakes_booked_notifications
    a.zero? ? "" : "(#{a})"
  end

  def booking_responses_notifications(cu)
    a = cu.bookings_responses_notification
    a.zero? ? "" : "(#{a})"
  end

end
