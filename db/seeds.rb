#Helper Methods
def generate_plot
  heroes = ["A squadron of robots", "#{Faker::Name.name}, a #{Faker::Name.title} down-on-their-luck,","The city of #{Faker::Address.city}","A loving couple","A tiny megacorp named #{Faker::Company.name}"].sample
  must_do_this ="must "+["#{Faker::Hacker.verb} #{Faker::Hacker.adjective} #{Faker::Hacker.noun}", "#{Faker::Company.bs}", "determine the meaning of #{Faker::Company.catch_phrase}"].sample
  before_the_deadline = "before the evil #{Faker::Hacker.abbreviation} begin Project #{Faker::App.name}."
  heroes+" "+must_do_this+" "+before_the_deadline
end

def random_review_title
  ['A Year of Walking', 'Candy For Two', 'Walking and Running', 'The Frog Catchers Field Manual', 'Tomato in the Window', 'A Dozen Heros', 'Finding a New Sun', 'Stop Asking, Just Do', 'What Lives on Pluto', 'Fishing With Chips', 'No Lonely Stars', 'Free Parking', 'Next Day Previous Night', 'Burning Water', 'Slicker Than Rain', 'Future Discretions', 'Covered and Warm', 'The Odd Sister', 'Falling Flags', 'Keyboard For Hire', 'Ready, Set, Die', 'Same Way Through', 'The Zookeeper and Her Tiger'].sample
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

def random_comment
  Comment.all.sample
end

#Actual Seeding
30.times do
  Movie.create(name: "#{Faker::App.name} (#{rand(1970..2015)} film)", aggregate_rating: rand(3..100), plot_summary: generate_plot, poster: "#{Faker::Avatar.image}")
end

200.times do |number|
  User.create(name: "user#{number}", password: "superdogs", email: "test#{number}@gmail.com", trusted: [true, false].sample )
end

400.times do
  Review.create(user: random_user, movie: random_movie, content: "#{Faker::Lorem.paragraph(2, true, 4)}", title: random_review_title, rating: rand(0..4) )
end

500.times do
  Comment.create(user: random_user, review: random_review, content: "#{Faker::Lorem.sentence(1, true)}")
end

500.times do
  Nested_Comment.create(user: random_user, comment: random_comment, content: "#{Faker::Lorem.sentence(1, true)}")
end
