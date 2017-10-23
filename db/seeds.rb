# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

nick = User.create(name: "Nick Hall", username: "nick_hall", password: "abc123")
becky = User.create(name: "Becky Newborn", username: "becky_newborn", password: "abc123")
josh = User.create(name: "Josh Denenberg", username: "josh_denenberg", password: "abc123")
es = User.create(name: "Esmery Corniel", username: "es_corniel", password: "abc123")
tim = User.create(name: "Tim Campbell", username: "tim_campbell", password: "abc123")


bacon = Recipe.create(name: "bacon", ingredients: "bacon", instructions: "make bacon", owner_id: 1)
grilledcheese = Recipe.create(name: "grilled cheese", ingredients: "bread cheese butter", instructions: "grill bread and cheese", owner_id: 2)
burger = Recipe.create(name: "hamburger", ingredients: "bun burger lettuce tomato", instructions: "make burger", owner_id: 3)
water = Recipe.create(name: "water", ingredients: "water", instructions: "pour water", owner_id: 5)
