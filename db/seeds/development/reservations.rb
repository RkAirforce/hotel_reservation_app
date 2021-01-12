%w(Trump Ivanca LinWood).each do |name|
  user = User.find_by(name: name)
  ["東京 台東区", "大阪　北新地", "京都 七条", "札幌　薄野"].each do |address|
    room = Room.find_by(address: address)
    number_of_people = rand(1..4)
    Reservation.create(
      user: user,
      room: room,
      start_date: "2021-02-01",
      end_date: "2021-2-08",
      number_of_people: number_of_people,
      total_amount: 7 * number_of_people * room.price
    )
  end
end
