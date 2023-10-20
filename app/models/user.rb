class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 12 }
  end
