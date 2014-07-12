class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, 
                    format: { with: /.+@.+\..+/, message: "format is invalid" }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :posts
  has_many :comments
end
