recipes = JSON.parse(File.read("#{Rails.root}/db/recipes-en.json"))

ingredients = []
recipes.each do |recipe|
  recipe['ingredients'].each do |ingredient|
    ingredients << ingredient
  end
end

ingredients.uniq!

ingredients = ingredients.map do |ingredient|
  Ingredient.new(name: ingredient)
end

Ingredient.import ingredients, batch_size: 1000

p 'Ingredients saved'
p '*'*20
