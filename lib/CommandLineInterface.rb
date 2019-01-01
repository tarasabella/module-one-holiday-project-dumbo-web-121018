require 'tty-prompt'

class CommandLineInterface

#declares prompt and my_user as a variable throughout program
  @@prompt = TTY::Prompt.new
  @@my_user = User.new

  def greet
    puts "Welcome to GoalDigger, a fun and personalized way to stay on track of any kind of life goal!"
  end

  def gets_user_input
#     prompt.ask(‘What is your email?’) { |q| q.validate :email }
    puts  "\nWe're here to keep you motivated and inspire you to continue working toward your goals. Let's get started on your personalized goals board!"
    puts "\n🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃🙃"
    username = @@prompt.ask("Please enter your username:")
    password = @@prompt.mask("Please enter your password:")
    # puts "Please enter your gpassword"
    # password = gets.chomp
    find_user(username, password)
  end

  def find_user(username, password)
    my_user = User.find_by(username:username, password:password)
    if my_user
      @@my_user = my_user
      #save user id to reference later on
      puts "\nWelcome, #{@@my_user.name}!"
      gets_menu_input()
    else
      puts "no user found!"
      gets_user_input()
    end
  end

  def gets_menu_input()
  mm_options = {
    "Browse Categories" => -> do browse_categories end,
    "View My Goals Board" => -> do view_my_board() end,
    "Create A New Goal" => -> do create_goals() end,
    "Logout" => -> do puts "Thanks for stopping by, #{@@my_user.name}!" end
    }
    @@prompt.select("Choose from the menu below:", mm_options)


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

    #save goal choice to an array with variable
    goal_choices = Goal.where(categoryid: category_id)

    @@prompt.select('Select a goal to view its details:') do |menu|
      goal_choices.each do |goal|
        menu.choice goal.title, -> { list_details(goal) }
      end
    end
  end

  def list_details(goal)

    puts "Title: #{goal.title}"
    puts "Description: #{goal.description}"

    if goal.userid == @@my_user.id
      # don't let user add to their board if it's already theirs
      gm_options =
      {
        "Return To Categories" => -> do view_my_board() end
      }
    else
      gm_options =
      {
        "Add Goal To My Board" => -> do add_this_goal(goal) {"This goal has been added to your goals board!"} end,
        "Return To Categories" => -> do view_my_board() end
      }
    end
    @@prompt.select("What would you like to do with this goal?", gm_options)

  end

  def add_this_goal(goal)
  puts "Let's add #{goal.title} to your board!"
  copied_goal = Goal.create(title: goal.title, description: goal.description, userid: @@my_user.id, categoryid: goal.categoryid)
  copied_goal.save
  puts "Yay! You've added a new goal to your board!"
  view_my_board()
end

  def create_goals()
    puts "Let's create a personalized goal to add to your board"
    puts "💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻"
    puts "Think of a title for your goal"
    my_goal_title = gets.chomp
    puts "Describe your personalized goal"
    my_goal_description = gets.chomp
    category_choices = Category.all
    prompt_result = @@prompt.select('Select a category for this goal:') do |menu|
      category_choices.each do |category|
        menu.choice category.name, category.id
      end
    end
    # puts "this! #{return_value}"
    Goal.create(title: my_goal_title, description: my_goal_description, userid: @@my_user.id, categoryid: prompt_result)
    puts "Yay! You've created a new goal, #{my_goal_title}"
  end

  def view_my_board()
    i = 1
    goals = []
    # save goal choice to an array with variable
    puts "Enter the number associated with the goal listed to perform an action:\n\n"
    Goal.where(userid: @@my_user.id).find_each do |goal|
      puts "#{i}. #{goal.title}, #{goal.description}"
      goals << goal
      i+= 1
    end
    user_input = gets.chomp
    goal_menu(goals[Integer(user_input) - 1])
  end

  def goal_menu(goal)
    gm_options =
    {
      "Edit Goal" => -> do edit_goal(goal) end,
      "Delete Goal" => -> do delete_goal(goal) {"This goal has been deleted!"} end,
      "Return To Goals Board" => -> do view_my_board() end
    }
    @@prompt.select("What would you like to do with this goal?", gm_options)

  end

  def delete_goal(goal)
    goal.destroy
    puts "This goal has been deleted!"
    view_my_board()
  end

  def edit_goal(goal)
    puts "Let's edit your goal!"
    puts "Original title: #{goal.title}"
    puts "Enter your new title:"
    goal.title = gets.chomp
    puts "Original description: #{goal.description}"
    puts "Enter your new description:"
    goal.description = gets.chomp
    goal.save
    puts "Yay! You've saved your updated goal, #{goal.title}"
  end

end
