class Category < ActiveRecord::Base

has_many :users, through: :goals

end
