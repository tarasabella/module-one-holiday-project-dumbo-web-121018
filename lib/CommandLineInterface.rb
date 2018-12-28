class CommandLineInterface

  def greet
    puts "Welcome to Goals Board!"

  end

  def gets_user_input
    puts  "We can help you"
    puts "😫😫😫😫😫😫😫😫😫😫"
    puts "\nPlease enter your username"
    username = gets.chomp
    puts "Please enter your password"
    password = gets.chomp
    find_username(username, password)
  end

  def find_username(username, password)
    my_user = User.find_by(username:username, password:password)
    if my_user
      #save user id to reference later on
      puts "\nWelcome, #{my_user.name}!"
      get_menu_input()
    else
      puts "no user found!"
      gets_user_input()
    end
  end

  def get_menu_input
    puts "Enter the number associated with the menu item:"
    puts "\t1. Browse Categories"
    puts "\t2. View My Goals Board"
    puts "\t3. Create a new goal"
    puts "\t4. Log out"
    menu_choice = gets.chomp
    if menu_choice=="1"
      browse_categories()
    elsif menu_choice=="2"
      puts "you picked 2!"
    elsif menu_choice=="3"
      puts "you picked 3!"
    elsif menu_choice=="4"
      puts "goodbye!"
    else
      puts "try again!"
      get_menu_input()
    end
  end
def browse_categories
  puts "Enter the number associated with category you would like to view"
  i = 1
  Category.all.each do |category|
    puts "#{i}. #{category.name}"
    i+= 1
end
end

end
# def find_password
#   User.all.select do |password|
#     password.user == find_password
#   end
# end
