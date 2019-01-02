class User < ActiveRecord::Base

has_many :goals
has_many :categories, through: :goals

def categories
  goals.map do |goal|
    goal.categories
    end
  end
  
end
