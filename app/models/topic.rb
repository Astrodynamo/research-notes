class Topic < ActiveRecord::Base
    has_many :notes
    belongs_to :user
end
