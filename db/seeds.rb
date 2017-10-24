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

session[:user_id] = nil

becky = User.create(name: "Becky Newborn", username: "beckynewborn", password: "becky123")
nick = User.create(name: "Nick Hall", username: "nickhall", password: "nick123")
josh = User.create(name: "Josh Denenberg", username: "joshdenenberg", password: "josh123")
tim = User.create(name: "Tim Campbell", username: "timcampbell", password: "tim123")
es = User.create(name: "Es Corniel", username: "escorniel", password: "esmery123")

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
