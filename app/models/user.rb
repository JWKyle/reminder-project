class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, :phone, :password_digest, presence: true

  has_many :reminders, foreign_key: :author_id
end
