require 'json'

recipes = JSON.parse(File.read("#{Rails.root}/db/recipes-en.json"))

recipes.each do |recipe|
  Recipe.create(recipe)
end
