require 'json'

recipes = JSON.parse(File.read("#{Rails.root}/db/recipes-en.json"))

recipes.each_with_index do |recipe, index|
  # Recipe.create(recipe)
  category = Category.find_by(title: recipe['category']) || Category.create!(title: recipe['category'])
  author = Author.find_by(name: recipe['author']) || Author.create!(name: recipe['author'])

  new_recipe = Recipe.new
  new_recipe.title = recipe['title']
  new_recipe.cook_time = recipe['cook_time']
  new_recipe.prep_time = recipe['prep_time']
  new_recipe.ratings = recipe['ratings']
  new_recipe.image = recipe['image']
  new_recipe.category = category
  new_recipe.author = author
  new_recipe.save!

  ingredients = []
  recipe['ingredients'].each do |ingredient|
    new_ingredient = Ingredient.find_by(name: ingredient) || Ingredient.create!(name: ingredient)
    ingredients << new_ingredient
  end
  new_recipe.ingredients = ingredients

  p "#{index.to_f / recipes.length}%"
end
