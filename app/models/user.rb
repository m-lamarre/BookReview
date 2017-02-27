class User < ApplicationRecord
  has_many :books

  before_save { email.downcase! }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # validates(:username, presence: true,
  #           length: { maximum: 50 },
  #           uniqueness: { case_sensitive: false })

  validates(:email, presence: true,
            length: { maximum: 100 },
            uniqueness: { case_sensitive: false },
            format: { with: EMAIL_REGEX })

  validates(:password, presence: true,
            length: { minimum: 6 })

  # has_secure_password
end
