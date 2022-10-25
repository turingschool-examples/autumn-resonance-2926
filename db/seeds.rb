# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cheese = Ingredient.create!(name: "Cheese", cost: 3)
salami = Ingredient.create!(name: "Salami", cost: 5)
broccoli = Ingredient.create!(name: "Broccoli", cost: 4)
pizza = Recipe.create!(name: "Pizza", complexity: 4, genre: "Italian")
RecipeIngredient.create!(ingredient: cheese, recipe: pizza)
RecipeIngredient.create!(ingredient: salami, recipe: pizza)
