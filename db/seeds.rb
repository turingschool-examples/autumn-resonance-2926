# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
recipe_1 = Recipe.create!(name: "Burger", complexity: 2, genre: "what?")
recipe_2 = Recipe.create!(name: "Lasagna", complexity: 6, genre: "why?")
ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 4)
ingredient_2 = Ingredient.create!(name: "Salt", cost: 1)
ingredient_3 = Ingredient.create!(name: "Onions", cost: 3)
ingredient_4 = Ingredient.create!(name: "Pasta", cost: 2)
recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_1.id)
recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_2.id)
recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: recipe_1.id, ingredient_id: ingredient_3.id)
recipe_ingredient_4 = RecipeIngredient.create!(recipe_id: recipe_2.id, ingredient_id: ingredient_1.id)
recipe_ingredient_5 = RecipeIngredient.create!(recipe_id: recipe_2.id, ingredient_id: ingredient_2.id)
recipe_ingredient_6 = RecipeIngredient.create!(recipe_id: recipe_2.id, ingredient_id: ingredient_3.id)
recipe_ingredient_7 = RecipeIngredient.create!(recipe_id: recipe_2.id, ingredient_id: ingredient_4.id)

