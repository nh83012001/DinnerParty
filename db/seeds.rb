# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Recipe.destroy_all
Userrecipe.destroy_all
Dinner.destroy_all
Invite.destroy_all
Course.destroy_all


##create users

becky = User.create(name: "Becky Newborn", username: "beckynewborn", password: "becky123")
nick = User.create(name: "Nick Hall", username: "nickhall", password: "nick123")
josh = User.create(name: "Josh Denenberg", username: "joshdenenberg", password: "josh123")
tim = User.create(name: "Tim Campbell", username: "timcampbell", password: "tim123")
es = User.create(name: "Es Corniel", username: "escorniel", password: "esmery123")
jason = User.create(name: "Jason Decker", username: "jasondecker", password: "jason123")
avi = User.create(name: "Avi Flombaum", username: "aviflombaum", password: "avi123")
adam = User.create(name: "Adam Enbar", username: "adamenbar", password: "adam123")
miguel = User.create(name: "Miguel McKevey", username: "miguelmckevey", password: "miguel123")

##create recipes

toast = Recipe.new(name: "Toast", ingredients: "Bread, Butter, Jam", instructions: "toast bread in toaster. Spread with butter or jam.")
toast.owner = becky
toast.users << becky
toast.save
pasta = Recipe.new(name: "Pasta", ingredients: "Pasta, Water, Salt, Marinara Sauce", instructions: "bring salted water to a boil. Cook pasta until al dente. Top with marinara sauce.")
pasta.owner = nick
pasta.users << nick
pasta.save
salad = Recipe.new(name: "Salad", ingredients: "Lettuce, tomato, cucumber, red onion, olive oil", instructions: "chop and toss ingredients together")
salad.owner = josh
salad.users << josh
salad.save
grilled_cheese = Recipe.new(name: "Grilled Cheese", ingredients: "Bread, cheese, butter", instructions: "Sandwich cheese between two slices of bread. Grill in sautee pan with butter.")
grilled_cheese.owner = tim
grilled_cheese.users << tim
grilled_cheese.save
chicken_parmesean = Recipe.new(name: "Chicken Parmesean", ingredients: "Chicken breast, breadcrumbs, marinara, mozzarella", instructions: "Coat chicken with breadcrumbs, fry in pan. Top with marinara sauce and mozzarella, bake for 20 minutes.")
chicken_parmesean.owner = becky
chicken_parmesean.users << becky
chicken_parmesean.save
hamburger = Recipe.new(name: "Hamburger", ingredients: "Hamburger bun, ground beef, seasoning", instructions: "make burger patty. Grill until cooked to personal liking. Serve on bun with ketchup, lettuce, tomato.")
hamburger.owner = jason
hamburger.users << jason
hamburger.save
lasagna = Recipe.new(name: "Lasagna", ingredients: "Lasagna sheets, tomato sauce, ground beef, ricotta cheese, shredded mozzarella.", instructions: "Layer lasagna sheets, sauce, meat, and ricotta until top of the pan. Top with mozzarella. Bake covered for 30 minutes, uncovered for 30 minutes.")
lasagna.owner = avi
lasagna.users << avi
lasagna.save
wings = Recipe.new(name: "Buffalo Wings", ingredients: "assorted chicken wings, hot sauce, butter.", instructions: "deep fry wings. coat in hot sauce and butter mixture. Serve hot with blue cheese dressing and celery sticks.")
wings.owner = miguel
wings.users << miguel
wings.save

##create userrecipe relationships

pasta.users << becky
salad.users << becky
grilled_cheese.users << nick
chicken_parmesean.users << nick
grilled_cheese.users << josh
toast.users << josh
salad.users << tim
toast.users << tim
salad.users << es
toast.users << es
wings.users << jason
lasagna.users << jason
salad.users << avi
toast.users << avi
lasagna.users << adam
wings.users << adam
chicken_parmesean.users << miguel
pasta.users << miguel
