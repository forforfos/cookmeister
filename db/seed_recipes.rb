json_recipes = JSON.parse(File.read("#{Rails.root}/db/recipes-en.json"))

recipes = []
json_recipes.each do |recipe|
  new_recipe = Recipe.new
  new_recipe.title = recipe['title']
  new_recipe.cook_time = recipe['cook_time']
  new_recipe.prep_time = recipe['prep_time']
  new_recipe.ratings = recipe['ratings']
  new_recipe.image = recipe['image']
  new_recipe.category = Category.find_by(title: recipe['category']) || Category.find_by(title: 'misc')
  new_recipe.author = Author.find_by(name: recipe['author']) || Author.find_by(name: 'unknown')

  recipes << new_recipe
end

Recipe.bulk_import recipes, batch_size: 1000

p 'Recipes saved'
p '*'*20
