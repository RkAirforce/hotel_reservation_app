module ReservationsHelper
  def reservation_validation(reservation)
    if !reservation.start_date || !reservation.end_date || !reservation.number_of_people
      reservation.errors.add(:start_date, "を入力してください") if !reservation.start_date
      reservation.errors.add(:end_date, "を入力してください") if !reservation.end_date
      reservation.errors.add(:end_date, "を入力してください") if !reservation.number_of_people
      render "rooms/show"
    else
      if Date.today > reservation.start_date || Date.today > reservation.end_date
        reservation.errors.add(:end_date, "は本日以降の日時で入力してください") if Date.today > reservation.end_date
        reservation.errors.add(:start_date, "は本日以降の日時で入力してください") if Date.today > reservation.start_date
        render "rooms/show"
      else
        if reservation.start_date > reservation.end_date
          render "rooms/show"
        else
          @date_diff = (reservation.end_date - reservation.start_date).to_i
          reservation.total_amount = reservation.room.price * @date_diff * reservation.number_of_people
        end
      end
    end
  end
end
