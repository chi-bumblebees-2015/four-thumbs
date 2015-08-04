movie1 = Movie.create(name: "Movie 1", aggregate_rating: 100, plot_summary: "stuff happens")
movie2 = Movie.create(name: "Blade Runner", aggregate_rating: 99, plot_summary: "never seen it, but i hear harrison ford is a robot")
movie3 = Movie.create(name: "Two Guns", aggregate_rating: 80, plot_summary: "Denzel does stuff")
movie4 = Movie.create(name: "Three Guns", aggregate_rating: 3, plot_summary: "Eh")


user1 = User.create(name: "user1", password: "superdogs", email: "test@gmail.com", trusted: true)
user2 = User.create(name: "user2", password: "superdogs", email: "test2@gmail.com", trusted: false)
user3 = User.create(name: "user3", password: "superdogs", email: "test3@gmail.com", trusted: true)


Review.create(user: user1, movie: movie1, content: "#{Faker::Lorem.paragraph(2, true, 4)}", title: "title of review", rating: 4)
Review.create(user: user1, movie: movie2, content: "#{Faker::Lorem.paragraph(2, true, 4)}", title: "title of review", rating: 3)
Review.create(user: user1, movie: movie3, content: "#{Faker::Lorem.paragraph(2, true, 4)}", title: "title of review", rating: 2)
Review.create(user: user2, movie: movie1, content: "#{Faker::Lorem.paragraph(2, true, 4)}", title: "title of review", rating: 2)
Review.create(user: user3, movie: movie2, content: "#{Faker::Lorem.paragraph(2, true, 4)}", title: "title of review", rating: 1)
Review.create(user: user3, movie: movie4, content: "#{Faker::Lorem.paragraph(2, true, 4)}", title: "title of review", rating: 4)
Review.create(user: user3, movie: movie3, content: "#{Faker::Lorem.paragraph(2, true, 4)}", title: "title of review", rating: 1)
