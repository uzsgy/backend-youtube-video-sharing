# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.transaction do
  User.create!(
    username: "admin",
    email: "admin@gmail.com",
    password: "password",
    password_confirmation: "password",
    role: "1",
  )

  10.times do |n|
    username = Faker::Internet.username(specifier: 5..10)
    User.create!(
      username: username,
      email: "#{username}@gmail.com",
      password: "password",
      password_confirmation: "password",
      role: "2",
    )
  end

  users = User.all

  10.times do |n|
    Video.create!(
      user: users.sample,
      code: "gDJJAs8GZGw",
      thumbnails: "https://i.ytimg.com/vi/gDJJAs8GZGw/maxresdefault.jpg",
      title: "Pháo Northside x Tez - SẬP ft. Megazetz x Hngtoom [Official Audio]",
      description: "\n \
      347.742 lượt xem  17 thg 2, 2022  #phaonorthside #tez #sap\n \
      Pháo Northside x @Tez O.Alquimista - SẬP (Official MV) ft. Megazetz, Hngtoom\n \
      Lyric Composer: Pháo ,Tez\n \
      Producer: Megazetz , Hngtoom \n \
      Mix & Master: Lowa Recordings \n \
      ---------\n \
      • Theo dõi Pháo tại : \n \
      Facebook: https://www.facebook.com/dieu.huyenn.3\n \
      Youtube: phaonorthside\n \
      SoundClound https://soundcloud.com/user-936326155\n \
      Email: Booking@Phaonorthside.com\n \
      Contact: (+84)909 84 9922\n \
      ---------------------------------------------------\n \
      • Vui lòng không reup video \n \
      • Mọi vấn đề liên quan tới bản quyền vui lòng gửi email tới: Booking@Phaonorthside.com\n \
      #phaonorthside #tez #sap",
    )
  end

  videos = Video.all
  prefs = Preference.prefs.to_a

  users.each do |user|
    5.times do
      user.preferences.create!(pref: prefs.sample.second, video: videos.sample)
    end
  end
  puts "seeding successful!"
rescue
  puts "seeding failure!"
end
