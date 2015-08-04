#Helper Methods
def generate_plot
  heroes = ["A squadron of robots", "#{Faker::Name.name}, a #{Faker::Name.title} down-on-their-luck","The city of #{Faker::Address.city}","A loving couple","A tiny megacorp named #{Faker::Company.name}"].sample
  must_do_this ="must "+["#{Faker::Hacker.verb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}", "#{Faker::Company.bs}", "determine the meaning of #{Faker::Company.catch_phrase}"].sample
  before_the_deadline = "before the evil #{Faker::Hacker.abbreviation} begin Project #{Faker::App.name}."
  heroes+" "+must_do_this+" "+before_the_deadline
end

def random_movie
  Movie.all.sample
end

def random_user
  User.all.sample
end

def random_review
  Review.all.sample
end

#Actual Seeding
30.times do
  Movie.create(name: "#{Faker::App.name} (#{rand(1970..2015)} film)", aggregate_rating: rand(3..100), plot_summary: generate_plot)
end

200.times do |number|
  User.create(name: "user#{number}", password: "superdogs", email: "test#{number}@gmail.com", trusted: [true, false].sample )
end

400.times do
  Review.create(user: random_user, movie: random_movie, content: "#{Faker::Lorem.paragraph(2, true, 4)}", title: "#{Faker::App.name}", rating: rand(0..4) )
end

500.times do
  Comment.create(user: random_user, review: random_review, content: "#{Faker::Lorem.sentence(1, true)}")
end
