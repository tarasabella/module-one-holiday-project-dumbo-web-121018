require 'tty-prompt'

class CommandLineInterface

#declares prompt and my_user as a variable throughout program
  @@prompt = TTY::Prompt.new
  @@my_user = User.new

  def greet
    @@prompt.warn("Welcome to GoalDigger! 🌈✨")
      #a personalized goal board to keep track of your life goals!} ")
    `say "Welcome to GOAL DIGGER!! our personalized goal board to keep track of YOUR life goals!"`
    @@prompt.error("\nOur mission is to help motivate & inspire YOU to become a better version of yourself.")
        #  "We're happy to have you! "
    `say "We're happy to have you join us! Our mission is to help motivate & inspire YOU to become a better version of yourself"`
    @@prompt.warn("\n...CREATE your goals")
    @@prompt.warn("\n......WORK towards them")
    @@prompt.warn("\n.........& ACHIEVE them!")
      #"So get ready to have some fun as you"
    puts "🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩"
    `say "So get ready to have some fun as you...CREATE your goals, ......WORK towards them and most importantly,.........ACHIEVE them!"`
  end

  def gets_user_input
    `say  "I think..., it is about TIME we make you a goal DIGGER"`
    @@prompt.error("\nLET'S START CREATING!\n👩🏼‍🎨✨🌈👨🏻‍🎨✨🌈‍‍")
    `say "Let's login so we can start creating your board!"`
    puts `clear`
    username = @@prompt.ask("\nPlease enter your username:")
    password = @@prompt.mask("Please enter your password:")
    find_user(username, password)
  end

  def find_user(username, password)
    my_user = User.find_by(username:username, password:password)
    if my_user
      @@my_user = my_user
      #save user id to reference later on
      puts `clear`
      @@prompt.warn("\nHey, #{@@my_user.name}!")
      @@prompt.ok("\nLet's get GOAL DIGGING 😜")
      `say "Wow, this is exciting...you are on your way to becoming a true, goal digger,...now it is time to start dreaming...start working...start achieving. Let's get goal digging!!!"`
      gets_menu_input()
    else
      @@prompt.error("Sorry, No User Found!")
      `say "Sorry, No User Found!"`
      gets_user_input()
  end
end
  def gets_menu_input()
    puts `clear`
    mm_options = {
    "Browse Categories" => -> do browse_categories end,
    "View My Goals Board" => -> do view_my_board() end,
    "Create A New Goal" => -> do create_goals() end,
    "Logout" => -> do puts "Thanks for stopping by, #{@@my_user.name}! 👋🏻" end
    }
    @@prompt.select("Choose from the Menu Below:", mm_options)

  end

  def browse_categories

    category_choices = Category.all
    puts `clear`
    @@prompt.select("Select a Category!:") do |menu|
      category_choices.each do |category|
        menu.choice category.name, -> { list_goals(category.id) }
      end
    end
  end

  #pass category_id as argument and from the list of goals find where category id = whats passed in
  def list_goals(category_id)
    puts `clear`
    #save goal choice to an array with variable
    goal_choices = Goal.where(categoryid: category_id)

    @@prompt.select('Select a Goal to View its Details:') do |menu|
      goal_choices.each do |goal|
        menu.choice goal.title, -> { list_details(goal) }
      end
    end
  end

  def list_details(goal)
    puts `clear`
    @@prompt.warn ("Title: #{goal.title}")
    @@prompt.warn ("\nDescription: #{goal.description}")

    if goal.userid == @@my_user.id
      # don't let user add to their board if it's already theirs
      gm_options =
      {
        "Return To My Board" => -> do view_my_board() {"This goal already exists on your board!"} end,
        "Return To Main Menu" => -> do gets_menu_input() end
      }

    else
      gm_options =
      {
        "Add Goal To My Board" => -> do add_this_goal(goal) {"This goal has been added to your goals board!"} end,
        "Return To My Board" => -> do view_my_board() end
      }
    end
    @@prompt.select("What Would You Like To Do?:", gm_options)

  end

  def add_this_goal(goal)
  puts "Let's add #{goal.title} to your board!"
  copied_goal = Goal.create(title: goal.title, description: goal.description, userid: @@my_user.id, categoryid: goal.categoryid)
  copied_goal.save
  `say "Yay! You've added a new goal to your board!"`
  view_my_board()
end

  def create_goals()
    puts `clear`
    `say "Yay! Let's create a personalized goal to add to your board"`
    puts "💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻💃🏼🕺🏻"
    @@prompt.warn("\nCreate a Title for Your Goal:")
    my_goal_title = gets.chomp
    @@prompt.warn("\nDescribe Your Goal:")
    my_goal_description = gets.chomp
    category_choices = Category.all
    prompt_result = @@prompt.select('Select a Category For This Goal:') do |menu|
      category_choices.each do |category|
        menu.choice category.name, category.id
      end
    end
    Goal.create(title: my_goal_title, description: my_goal_description, userid: @@my_user.id, categoryid: prompt_result)
    puts "Yay! You've created a new goal, #{my_goal_title}"
    view_my_board()
  end

  def view_my_board()
  puts `clear`

  #my_goals = Goal.where(userid: @@my_user.id)
  #  @@prompt.select("Select a Goal Title to View its Description:")  do |menu|
  #     my_goals.each do |goal|
  #     menu.choice goal.title, -> { list_details(goal) }
  #     end
  #   end
  # end
    #puts goal title and option to select for its description
    i = 1
    goals = []
    # save goal choice to an array with variable
    puts "Enter the Number Associated With One of Your Goals:\n\n"
      `say "Enter the number associated with one of your goals to perform an action"`
    Goal.where(userid: @@my_user.id).find_each do |goal|
      @@prompt.warn("\n#{i}. #{goal.title}")
      @@prompt.ok("n#{goal.description}")
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
    puts `clear`
    @@prompt.select("What Would You Like to Do With This Goal?", gm_options)

  end

  def delete_goal(goal)
    goal.destroy
    @@prompt.error("This Goal Has Been DELETED!")
    puts "😵😵😵"
    view_my_board()
  end

  def edit_goal(goal)
    puts `clear`
    `says "Okay, great...Let's edit your goal!"`
    @@prompt.warn("Original Title: #{goal.title}")
    @@prompt.ok("Enter Your New Title:")
    goal.title = gets.chomp
    @@prompt.warn("Original Description: #{goal.description}")
    @@prompt.ok("Enter Your New Description:")
    goal.description = gets.chomp
    goal.save
    @@prompt.warn("\nYou've Updated Your Goal, #{goal.title}")
    `says `
    gets_menu_input()
  end
end
