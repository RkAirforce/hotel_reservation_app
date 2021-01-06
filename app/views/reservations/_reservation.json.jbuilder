json.extract! reservation, :id, :user_id, :room_id, :start_date, :end_date, :number_of_people, :total_amount, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
