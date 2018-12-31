class CommandLineInterface

  def greet
    puts "Welcome to GoalDigger, a fun and personalized way to stay on track of and kind of life goal!"
  end

  def gets_user_input
    puts  "\nWe're here to keep you motivated and inspire you to continue working toward your goals. Let's get started on your personalized goals board!"
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
      gets_menu_input(my_user.id)
    else
      puts "no user found!"
      gets_user_input()
    end
  end

  def gets_menu_input(user_id)
    puts "Enter the number associated with the menu item:"
    puts "\t1. Browse Categories"
    puts "\t2. View My Goals Board"
    puts "\t3. Create a New Goal"
    puts "\t4. Logout"
    menu_choice = gets.chomp
    if menu_choice=="1"
      browse_categories()
    elsif menu_choice=="2"
      puts view_my_board(user_id)
      # gets_menu_input(user_id)
    elsif menu_choice=="3"
      puts create_goals(user_id)
      gets_menu_input(user_id)
    elsif menu_choice=="4"
      puts "Thanks for stopping by!"
      greet()
      gets_user_input()
    else
      puts "try again!"
      gets_menu_input(user_id)
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

def create_goals(user_id)
  puts "Let's create a personalized goal to add to your board"
  puts "💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻"
  puts "Think of a title for your goal"
  my_goal_title = gets.chomp
  puts "Describe your personalized goal"
  my_goal_description = gets.chomp
  Goal.create(title: my_goal_title, description: my_goal_description, userid: user_id)
  puts "Yay! You've created a new goal, #{my_goal_title}"
end

 def view_my_board(user_id)
  i = 1
  goals = []
  # goal_descriptions = []
  # #save goal choice to an array with variable
  # my_goal_board = Goal.find_by(userid: user_id)
  puts "Enter the number associated with the goal listed to perform an action:\n\n"
  Goal.where(userid: user_id).find_each do |goal|
    puts "\t#{i}. #{goal.title}, #{goal.description}"
    goals << goal
    i+= 1
  end
  user_input = gets.chomp
  goal_menu(user_id, goals[Integer(user_input) - 1])
end

def goal_menu(user_id, goal)
  puts "What would you like to do with this goal?"
  puts "\t1. Edit Goal"
  puts "\t2. Delete Goal"
  puts "\t3. Return to Goals Board"
  menu_choice = gets.chomp
  if menu_choice=="1"
    puts "Let's edit your goal!"
    puts "Original title: #{goal.title}"
    puts "Enter your new title:"
    goal.title = gets.chomp
    puts "Original description: #{goal.description}"
    puts "Enter your new description:"
    goal.description = gets.chomp
    goal.save
    puts "Yay! You've saved your updated goal, #{goal.title}"
    view_my_board(user_id)
  elsif menu_choice=="2"
    goal.destroy
    puts "Goal deleted!"
    view_my_board(user_id)
  elsif menu_choice=="3"
    view_my_board(user_id)
  else
    puts "try again!"
    goal_menu(user_id, goal_id)
  end
end

def delete_goal(title_of_goal)
  delete_goal = Goal.find_by(title: title_of_goal)
  delete_goal.destroy
  # puts hey = Goal.find_by(title: "hey")
  # hey.destroy
end
