class User < ActiveRecord::Base

has_many :goals, through: :categories

def categories
  goals.map do |goal|
    goal.categories
  end
# def categories
#   Category.where(category_id: self:id)
# end

end
end
