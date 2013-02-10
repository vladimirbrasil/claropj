class Proprietario < ActiveRecord::Base
  attr_accessible :email, :nome, :obs

  before_save { self.email.downcase! }

  validates :nome, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

end
