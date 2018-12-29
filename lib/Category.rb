class Category < ActiveRecord::Base

has_many :users, through: :goals

def users
  goals.map do |goal|
    goal.user
  end

end
end 
