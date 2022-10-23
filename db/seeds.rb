# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@burger = Recipe.create!(name: 'Hamburger', complexity: 1, genre: 'American')
@raw = Recipe.create!(name: 'Beef Tartare', complexity: 3, genre: 'French')
@beef = Ingredient.create!(name: 'Ground Beef', cost: 2)
@salt = Ingredient.create!(name: 'Salt', cost: 4)
@egg = Ingredient.create!(name: 'Egg', cost: 2)
