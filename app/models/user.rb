class User < ActiveRecord::Base
  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  acts_as_voter
  has_secure_password
  has_many :reviews


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def trusted_string
    if self.trusted
      "Trusted Reviewer"
    else
      ""
    end
  end
end
