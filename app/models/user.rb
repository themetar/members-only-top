class User < ApplicationRecord
  has_secure_password

  def self.random_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
