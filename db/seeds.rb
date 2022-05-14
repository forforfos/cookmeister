require 'json'

recipes = JSON.parse(File.read("#{Rails.root}/db/recipes-en.json"))

categories = []
recipes.each do |recipe|
  categories << recipe['category']
end
categories.uniq!
categories.each do |category|
  Category.create!(title: category)
end

authors = []
recipes.each do |recipe|
  authors << recipe['author']
end
authors.uniq!
authors.each do |author|
  Author.create!(name: author)
end

ingredients = []
recipes.each do |recipe|
  recipe['ingredients'].each do |ingredient|
    ingredients << ingredient
  end
end
ingredients.uniq!
ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end

p '*'*20
p 'Ingredients saved!'
p '*'*20

recipes.each do |recipe|
  category = Category.find_by(title: recipe['category'])
  author = Author.find_by(name: recipe['author'])
  new_recipe = Recipe.new
  new_recipe.title = recipe['title']
  new_recipe.cook_time = recipe['cook_time']
  new_recipe.prep_time = recipe['prep_time']
  new_recipe.ratings = recipe['ratings']
  new_recipe.image = recipe['image']
  new_recipe.category = category
  new_recipe.author = author

  ingredients = []
  recipe['ingredients'].each do |ingredient|
    new_ingredient = Ingredient.find_by(name: ingredient)
    ingredients << new_ingredient
  end
  new_recipe.ingredients = ingredients
  new_recipe.save
end
