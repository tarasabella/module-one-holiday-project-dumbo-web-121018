User.destroy_all
Category.destroy_all
Goal.destroy_all

#tara = User.create(name: "Tara", username: "misubella", password: "tictactoe")
tara = User.create(name: "Tara", username: "tara", password: "tara")
ben = User.create(name: "Ben", username: "ben", password: "ben")

healthAndFitness = Category.create(name: "Health and Fitness Goals 🏋🏼‍")
relationship = Category.create(name: "Relationship Goals 👫")
financial = Category.create(name: "Financial Goals 💰")
career = Category.create(name: "Career Goals 💼")
educational = Category.create(name: "Educational Goals 🧠")
spiritual = Category.create(name: "Spiritual Goals 🌟")
travel = Category.create(name: "Travel Goals ✈️")
personalDevelopment = Category.create(name: "Personal Development Goals 💪🏻")

goal1 = Goal.create(title: "Be More Consistent With Your Workout Routine", description: "Create a habit of morning exercise to boost your metabolism, work towards your physical fitness, develop self-discipline, and improve your focus and mental energy.\nTip 1: Plan ahead by setting an alarm and laying your gym clothes out.\nTip 2: Approach your workout plan by starting small and building up in intensity and frequency to get you into the habit of working out in the morning consistently.\nTip 3: Associate your exercise routine with a positive reward to reinforce the habit.", categoryid: healthAndFitness.id, userid:tara.id)
goal2 = Goal.create(title: "Stay Hydrated", description: "Drink 8-10 glasses of water daily", categoryid: healthAndFitness.id, userid:tara.id)
goal3 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "Meditation is a simple and effective way to relieve stress. Spending a few minutes each day can help clear your mind and restore your calm & inner peace", categoryid: personalDevelopment, userid:tara.id)
goal4 = Goal.create(title: "Be More Considerate", description: "Practice kindness by seeking out opportunities to help others, whether it's volunteering or simply holding the door open for a stranger.", categoryid: spiritual.id, userid:tara.id)
goal5 = Goal.create(title: "Increase Professional Knowledge & Training", description: "Seek out ways to fine-tune your skills & strive to become more marketabke to employers.", categoryid: career.id, userid:tara.id)
goal6 = Goal.create(title: "Build & Maintain Good Credit", description: "Strive to build a solid credit history & maintain a high credit score", categoryid: financial.id, userid:tara.id)
goal7 = Goal.create(title: "Eliminate Sugar from your Diet", description: "Cut out processed sugars", categoryid: healthAndFitness.id, userid:tara.id)
# goal8 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "Strive to build a solid credit history & maintain a high credit score", categoryid: financial.id, userid:tara.id)
goal8 = Goal.create(title: "Practice Gratitude in your Relationships", description: "Expressing your gratitude to others can help stregthen the relationships in your life.", categoryid: relationship.id, userid:tara.id)
goal9 = Goal.create(title: "Discover Your Roots", description: "Travel & explore the country where your family comes from to learn more about your heritage and gain a deeper sense of your family history.", categoryid: travel.id, userid:ben.id)
# goal11 = Goal.create(title: "Learn To Cope With Stress Through Meditation", description: "This is a description! Don't you love it?", categoryid: personalDevelopment.id, userid:tara.id)
