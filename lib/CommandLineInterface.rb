class CommandLineInterface

  # myUser = User.new

  def greet
    puts "Welcome to GoalDigger, a fun and personalized way to stay on track of and kind of life goal!"
  end

  def gets_user_input
    puts  "\nWe're here to keep you motivated and inspire you to continue pushing toward your goals. Let's get started on your personalized GoalDigger board!"
    puts "\n🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃"
    puts "\nPlease enter your username"
    username = gets.chomp
    puts "Please enter your password"
    password = gets.chomp
    find_user(username, password)
  end

  def find_user(username, password)
    my_user = User.find_by(username:username, password:password)
    if my_user
      #save user id to reference later on
      puts "\nWelcome, #{my_user.name}!"
      myUser = my_user
      gets_menu_input()
    else
      puts "no user found!"
      gets_user_input()
    end
  end

  def gets_menu_input
    puts "Enter the number associated with the menu item:"
    puts "\t1. Browse Categories"
    puts "\t2. View My Goals Board"
    puts "\t3. Create a new goal"
    puts "\t4. Log out"
    menu_choice = gets.chomp
    if menu_choice=="1"
      browse_categories()
    elsif menu_choice=="2"
      puts view_my_board()
    elsif menu_choice=="3"
      puts create_goals()
    elsif menu_choice=="4"
      puts "Thanks for stopping by!"
      greet()
      gets_user_input()
    else
      puts "try again!"
      gets_menu_input()
    end
  end
end

def browse_categories
  i = 1
  category_ids = []
  Category.all.each do |category|
    puts "#{i}. #{category.name}"
    category_ids << category.id
    i+= 1
  end
  puts "Enter the number associated with category you would like to view"
  category_choice = gets.chomp
  list_goals(category_ids[Integer(category_choice)-1])
end

#pass category_id as argument and from the list of goals find where category id = whats passed in
def list_goals(category_id)
  i = 1
  goal_descriptions = []
  #save goal choice to an array with variable
  goal_choices = Goal.where(categoryid: category_id)
  goal_choices.each do |goal|
    puts "#{i}. #{goal.title}"
    goal_descriptions << goal.description
    i += 1
  end
  puts "Enter the number associated with a title to view its description"
  title_choice = gets.chomp
  list_description(goal_descriptions[Integer(title_choice)-1])
end


def list_description(goal_description)
  goal_description = Goal.where(description: goal_description)
  goal_description.each do |title|
  puts "#{title.description}"
end
end

def create_goals
  puts "Let's create a personalized goal to add to your board"
  puts "💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻"
  puts "Think of a title for your goal"
  my_goal_title = gets.chomp
  puts "Describe your personalized goal"
  my_goal_description = gets.chomp
  Goal.create(title: my_goal_title, description: my_goal_description)
  puts "Yay! You've created a new goal, #{my_goal_title}"
end

#
#
# # def view_my_board(create_goals)
# #
# #     puts "#{my_goal_title}"
# #     puts "#{my_goal_description}"
# #   # my_new_goal = Goals.create
#   # new_goal = Goals.create(title: "Eat more vegetables", description: "Make green juices each morning")
#   # puts Goals.where(description: my_goal_description)
#   #
#
#
# # def view_my_board
#   # user_goals = []
#   # user_goals << my_new_goals
#
# # # def add_goal(list_description)
# # #   Goal.create
