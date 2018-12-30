class CommandLineInterface

  myUser = User.new

  def greet
    puts "Welcome to GoalDigger, a fun and personalized way to stay on track of ANY kind of life goal!"

  end

  def gets_user_input
    puts  "\nWe're here to keep you motivated and inspire you to continue pushing towards your goals. Let's get started on your GoalDigger board! "
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
      puts "View My Goals Board!"
    elsif menu_choice=="3"
      puts "Create New Goal!"
    elsif menu_choice=="4"
      puts "Logout"
    else
      puts "try again!"
      gets_menu_input()
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
  puts category_ids[Integer(category_choice)-1]
end

def goals
  Goals.select do |goal|
  goal.where "#{categoryid} == categoryid"
end
end

def category_goal
  if category_choice=="1"
    goals()
  elsif category_choice=="2"

  elsif category_choice=="3"

  elsif category_choice=="4"

  elsif category_choice=="5"

  elsif category_choice=="6"

  elsif category_choice=="7"

  elsif category_choice=="8"

  else
    puts "try again!"
    get_menu_input()
  end

end
end
