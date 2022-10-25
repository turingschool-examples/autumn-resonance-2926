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

spaghetti = Recipe.create!(name: "Spaghetti", complexity: 1, genre: "Italian")
chicken_orzo = Recipe.create!(name: "Chicken Orzo", complexity: 3, genre: "Greek")

RecipeIngredient.create!(recipe: spaghetti, ingredient: ground_beef)
RecipeIngredient.create!(recipe: spaghetti, ingredient: salt)
RecipeIngredient.create!(recipe: spaghetti, ingredient: pasta)
RecipeIngredient.create!(recipe: spaghetti, ingredient: tomato_paste)
RecipeIngredient.create!(recipe: spaghetti, ingredient: butter)
RecipeIngredient.create!(recipe: chicken_orzo, ingredient: butter)
RecipeIngredient.create!(recipe: chicken_orzo, ingredient: salt)
RecipeIngredient.create!(recipe: chicken_orzo, ingredient: chicken)
RecipeIngredient.create!(recipe: chicken_orzo, ingredient: orzo)
RecipeIngredient.create!(recipe: chicken_orzo, ingredient: feta)

