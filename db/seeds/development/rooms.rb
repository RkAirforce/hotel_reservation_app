adress_lists = ["東京 荒川区", "東京 台東区", "東京 港区", "大阪 戎橋",
                  "大阪　北新地", "大阪　淀川", "京都　三条", "京都　河原城",
                  "京都 七条", "京都 道の駅", "札幌　薄野", "札幌　函館", "札幌 羊ヶ丘", "札幌 南区定山"]

%w(Joe Obama Nancy Trump Ivanca Mike LinWood).each do |user_name|
  user = User.find_by(name: user_name)
  adress_lists.each do |address_list|
    Room.create(
      maker: user,
      name: Faker::Movies::StarWars.character,
      description: Faker::Lorem.characters(number: 40),
      price: rand(1000..200000),
      address: address_list
    )
  end
end
