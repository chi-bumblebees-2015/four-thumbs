class Movie < ActiveRecord::Base
  has_many :reviews

  def self.alphabetic
    self.all.sort{|x,y| x.name <=> y.name }
  end

  def trusted_reviews
  	reviews.joins(:user).where('users.trusted' => true).sort do |x,y|
      y.get_upvotes.size <=> x.get_upvotes.size
    end
  end

  def user_reviews
  	reviews.joins(:user).where('users.trusted' => false).sort do |x,y|
      y.get_upvotes.size <=> x.get_upvotes.size
    end
  end

  def all_reviews
  	reviews.joins(:user).sort do |x,y|
      x_addition = if x.user.trusted then 2 else 1 end
      y_addition = if y.user.trusted then 2 else 1 end
      y.get_upvotes.size*y_addition <=> x.get_upvotes.size*x_addition
    end
  end

  def full_movie_score
    user_review_number_total = self.reviews.select{|review| !review.user.trusted }.map{|review| review.user.reviews.count * review.rating}.reduce(:+)
    user_review_number_count = self.reviews.select{|review| !review.user.trusted }.map{|review| review.user.reviews.count}.reduce(:+)
    trusted_review_number_total = self.reviews.select{|review| review.user.trusted }.map{|review| review.user.reviews.count * review.rating}.reduce(:+)
    trusted_review_number_count = self.reviews.select{|review| review.user.trusted }.map{|review| review.user.reviews.count}.reduce(:+)

    trusted_multiplier = 2
    total = user_review_number_total + trusted_multiplier*trusted_review_number_total ||= 0
    count = user_review_number_count + trusted_multiplier*trusted_review_number_count ||= 1
    return total.to_f/count.to_f
  end

  def movie_score
    full_movie_score.round
  end

end
