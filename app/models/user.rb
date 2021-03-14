class User < ActiveRecord::Base
    has_many :topics
    has_secure_password
end
