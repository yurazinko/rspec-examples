class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :posts

  def self.by_letter(letter)
    where("email LIKE ?", "#{letter}%").order(:email)
  end
end
