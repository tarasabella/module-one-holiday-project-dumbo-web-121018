class User < ActiveRecord::Base

has_many :categories, through: :goals

end
