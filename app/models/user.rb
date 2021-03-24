class User < ActiveRecord::Base
    has_many :topics
    has_secure_password
    ###add a has_many_through to notes?
end
