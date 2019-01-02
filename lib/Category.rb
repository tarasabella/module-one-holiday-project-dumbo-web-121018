class Category < ActiveRecord::Base

has_many :goals, through: :user

def users
  goals.map do |goal|
    goal.user
  end

end
end
