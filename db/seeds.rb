# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ActiveRecord::Base.transaction do
  User.create(
    username: "admin",
    email: "admin@gmail.com",
    password: "password",
    password_confirmation: "password",
    role: "1",
  )

  (1..10).each do |n|
    username = Faker::Internet.username(specifier: 5..10)
    User.create(
      username: username,
      email: "#{username}@gmail.com",
      password: "password",
      password_confirmation: "password",
      role: "2",
    )
  end

  (1..10).each do |n|
    Video.create(
      user: User.all.sample,
      url: "https://www.youtube.com/watch?v=gDJJAs8GZGw",
      embed_url: `<iframe width="560" height="315" src="https://www.youtube.com/embed/gDJJAs8GZGw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>`,
      title: "Pháo Northside x Tez - SẬP ft. Megazetz x Hngtoom [Official Audio]",
      description: `
      347.742 lượt xem  17 thg 2, 2022  #phaonorthside #tez #sap
      Pháo Northside x @Tez O.Alquimista - SẬP (Official MV) ft. Megazetz, Hngtoom
      Lyric Composer: Pháo ,Tez
      Producer: Megazetz , Hngtoom 
      Mix & Master: Lowa Recordings 
      ---------
      • Theo dõi Pháo tại : 
      Facebook: https://www.facebook.com/dieu.huyenn.3
      Youtube: phaonorthside
      SoundClound https://soundcloud.com/user-936326155
      Email: Booking@Phaonorthside.com
      Contact: (+84)909 84 9922
      ---------------------------------------------------
      • Vui lòng không reup video 
      • Mọi vấn đề liên quan tới bản quyền vui lòng gửi email tới: Booking@Phaonorthside.com
      #phaonorthside #tez #sap`,
    )
  end
  puts "seeding successful!"
rescue
  puts "seeding failure!"
end
