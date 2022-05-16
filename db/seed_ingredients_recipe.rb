recipes = JSON.parse(File.read("#{Rails.root}/db/recipes-en.json"))

ingredients_recipes = []
recipes.each do |recipe|
  rec = Recipe.find_by(title: recipe['title'])

  recipe['ingredients'].each do |ingredient|
    ingredients_recipes << { recipe_id: rec.id, ingredient_id: Ingredient.find_by(name: ingredient).id }
  end
end

IngredientsRecipes.insert_all ingredients_recipes

p 'Saved ingredients recipes'
p 'Database is set!'
