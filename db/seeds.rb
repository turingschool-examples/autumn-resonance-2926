# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@pasta = Recipe.create!(name: "Pasta", complexity: 2, genre: "Italian")
@pizza = Recipe.create!(name: "Pizza", complexity: 2, genre: "Italian")

@cheese = Ingredient.create!(name: "cheese", cost: 2)
@sauce = Ingredient.create!(name: "sauce", cost: 4)
@dough = Ingredient.create!(name: "dough", cost: 5)
@penne =  Ingredient.create!(name: "penne", cost: 3)
@garlic =  Ingredient.create!(name: "garlic", cost: 1)
@bread =  Ingredient.create!(name: "bread", cost: 3)

# @pasta_dinner = Recipe_ingredient.create!(recipe_id: @pasta.id, ingredient_id: @penne.id  )
# @pasta_dinner = Recipe_ingredient.create!(recipe_id: @pasta.id, ingredient_id: @sauce.id  )
# @pasta_dinner = Recipe_ingredient.create!(recipe_id: @pasta.id, ingredient_id: @bread.id  )

# @pizza_dinner = Recipe_ingredient.create!(recipe_id: @pizza.id, ingredient_id: @dough.id  )
# @pizza_dinner = Recipe_ingredient.create!(recipe_id: @pizza.id, ingredient_id: @sauce.id  )
# @pizza_dinner = Recipe_ingredient.create!(recipe_id: @pizza.id, ingredient_id: @garlic.id  )