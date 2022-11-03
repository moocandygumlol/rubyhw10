class User < ApplicationRecord
    has_secure_password
    has_many :item
    has_many :inventory
end
