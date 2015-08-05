class Movie < ActiveRecord::Base
  has_many :reviews

  def self.alphabetic
    self.all.sort{|x,y| x.name <=> y.name }
  end

  def self.rank_movies
    self.all.select{|movie| movie.reviews.count > 0}.sort{|x,y| y.full_movie_score <=> x.full_movie_score }[0..9]
  end

  def unhidden_reviews
    self.reviews.where(hidden:false)
  end

  def trusted_reviews
  	unhidden_reviews.joins(:user).where('users.trusted' => true).sort do |x,y|
      y.get_upvotes.size <=> x.get_upvotes.size
    end
  end

  def user_reviews
  	unhidden_reviews.joins(:user).where('users.trusted' => false).sort do |x,y|
      y.get_upvotes.size <=> x.get_upvotes.size
    end
  end

  def all_reviews
  	unhidden_reviews.joins(:user).sort do |x,y|
      x_addition = if x.user.trusted then 2 else 1 end
      y_addition = if y.user.trusted then 2 else 1 end
      y.get_upvotes.size*y_addition <=> x.get_upvotes.size*x_addition
    end
  end

  def full_movie_score
    if self.reviews && self.reviews.select{|review| !review.user.trusted }.count > 0
      user_review_number_total = self.reviews.select{|review| !review.user.trusted }.map{|review| review.rating}.reduce(:+)
      user_review_number_count = self.reviews.select{|review| !review.user.trusted }.count
    else
      user_review_number_count = 0
      user_review_number_total = 0
    end
    if self.reviews && self.reviews.select{|review| review.user.trusted }.count > 0
      trusted_review_number_total = self.reviews.select{|review| review.user.trusted }.map{|review| review.rating}.reduce(:+)
      trusted_review_number_count = self.reviews.select{|review| review.user.trusted }.count
    else
      trusted_review_number_count = 0
      trusted_review_number_total = 0
    end

    trusted_multiplier = 2
    total = user_review_number_total + trusted_multiplier*trusted_review_number_total ||= 0
    count = user_review_number_count + trusted_multiplier*trusted_review_number_count ||= 1
    return total.to_f/count.to_f
  end

  def movie_score
    full_movie_score.round
  end


end
