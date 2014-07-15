class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }

  has_secure_password

  before_create :initial_remember_token

  has_many :posts


  private

    def initial_remember_token
      self.remember_token = User.encrypt_token(User.get_token)
    end

    def User.get_token
      SecureRandom.urlsafe_base64
    end

    def User.encrypt_token(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

end
