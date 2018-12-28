tara = User.create(name: "Tara", username: "misubella", password: "tictactoe")
ben = User.create(name: "Ben", username: "bentay", password: "password")

healthAndFitness = Category.create(name: "Health and Fitness Goals")
relationship = Category.create(name: "Relationship Goals")
financial = Category.create(name: "Financial Goals")
career = Category.create(name: "Career Goals")
educational = Category.create(name: "Educational Goals")
spiritual = Category.create(name: "Spiritual Goals")
travel = Category.create(name: "Travel Goals")
personalDevelopment = Category.create(name: "Personal Development Goals")

goal1 = Goal.create(title: "Be More Consistent With Your Workout Routine", description: "Create a habit of morning exercise to boost your metabolism, work towards your physical fitness, develop self-discipline, and improve your focus and mental energy.\nTip 1: Plan ahead by setting an alarm and laying your gym clothes out.\nTip 2: Approach your workout plan by starting small and building up in intensity and frequency to get you into the habit of working out in the morning consistently.\nTip 3: Associate your exercise routine with a positive reward to reinforce the habit.", categoryid: healthAndFitness.id, userid:tara.id)
goal2 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: relationship.id, userid:tara.id)
goal3 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: financial.id, userid:tara.id)
goal4 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: career.id, userid:tara.id)
goal5 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: educational.id, userid:tara.id)
goal6 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: spiritual.id, userid:tara.id)
goal7 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: travel.id, userid:tara.id)
goal8 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: personalDevelopment.id, userid:tara.id)
goal9 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: personalDevelopment.id, userid:tara.id)
goal10 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: personalDevelopment.id, userid:tara.id)
goal11 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "", categoryid: personalDevelopment.id, userid:tara.id)


#
# findhealthAndFitness = Category.find(goal1.categoryid)
# puts "healthAndFitness id: #{healthAndFitness.id}"
# puts "goal1 categoryid: #{goal1.categoryid}"
# puts "goal1 description: #{goal1.description}"
# puts "healthAndFitness name: #{findhealthAndFitness.name}"
# puts "goal1 userid: #{goal1.userid}"
# puts "tara id: #{tara.id}"
#
#
# findrelationship = Category.find(goal2.categoryid)
# puts "relationship id: #{relationship.id}"
# puts "goal2 categoryid: #{goal2.categoryid}"
# puts "relationship name: #{relationship.name}"
