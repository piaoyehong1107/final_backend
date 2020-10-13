class User < ApplicationRecord
    has_many :friendships
    has_secure_password

    validates :username, uniqueness: true
    validates :password, length: {minimum: 5}
end
