# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
salt = Ingredient.create!(name: "Salt", cost: 4)
pasta = Ingredient.create!(name: "Pasta", cost: 3)
tomato_paste = Ingredient.create!(name: "Tomato Paste", cost: 2)
butter = Ingredient.create!(name: "Butter", cost: 5)
chicken = Ingredient.create!(name: "Chicken", cost: 10)
orzo = Ingredient.create!(name: "Orzo", cost: 3)
feta = Ingredient.create!(name: "Feta Cheese", cost: 7)