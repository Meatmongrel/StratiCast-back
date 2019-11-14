class User < ApplicationRecord
    has_secure_password
    has_many :user_favorites
    has_many :favorites, through: :user_favorites
end
