class User < ActiveRecord::Base

  before_save :capitalized_name
  before_save { self.email = email.downcase }


  NAME_REGEX = /\A[A-Z][a-z]*\b/
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,
            length: { minimum: 1, maximum: 100 },
            presence: true,
            format: { with: NAME_REGEX }

  validates :password, presence: true, length: { minimum: 6 }

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

  has_secure_password

  def capitalized_name
    self.name.split(' ').map!{ |names| names.capitalize! }.join(' ')
  end

end
